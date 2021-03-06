import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/pages/rm.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class RMDetailPage extends StatefulWidget {
  final String? userId;
  final RM? rm;

  RMDetailPage(this.userId, {this.rm});

  @override
  _RMDetailPageState createState() => _RMDetailPageState();
}

class _RMDetailPageState extends State<RMDetailPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool? isAdmin;
  String? pictureUrl;

  @override
  void initState() {
    isAdmin = Get.find<FirebaseController>().admin.value;
    if (widget.rm != null) {
      print(widget.rm);
      setState(() {
        this.pictureUrl=widget.rm!.pictureUrl;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RM",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            isAdmin == true
                ? Get.toNamed(AppRoutes.USER_PROFILE + "?id=" + widget.userId!)
                : Get.toNamed(AppRoutes.HOME);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              image: AssetImage("assets/images/bg3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AbsorbPointer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () async {
                                  var result = await openDialogue(context);
                                  print(result);
                                  setState(() {
                                    this.pictureUrl = result;
                                  });
                                },
                                child: pictureUrl == null
                                    ? CircleAvatar(
                                    minRadius: 50,
                                    maxRadius: 50,
                                    child: Icon(Icons.add))
                                    : Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(pictureUrl!)),
                                  ),
                                )),
                            FormBuilderTextField(
                              name: 'name',
                              decoration: InputDecoration(
                                  labelText: 'Nom',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              initialValue: widget.rm?.name.toString(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            FormBuilderTextField(
                              name: 'value',
                              decoration: InputDecoration(
                                  labelText: 'Charge',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.rm?.value.toString(),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    absorbing: widget.rm != null,
                  ),
                  widget.rm == null
                      ? Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            _formKey.currentState?.save();
                            if (_formKey.currentState?.validate() ==
                                true &&
                                pictureUrl != null) {
                              RM rm = RM.fromMap(
                                  _formKey.currentState?.value);
                              rm.date = DateTime.now();
                              rm.pictureUrl = pictureUrl;
                              await FirebaseController.to
                                  .addRM(rm, widget.userId!);
                              Get.to(RMsPage(widget.userId));
                            } else {
                              showShortToast("Validation failed");
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: MaterialButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Reset",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _formKey.currentState?.reset();
                          },
                        ),
                      ),
                    ],
                  )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> openDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Select image",
              textAlign: TextAlign.center,
            ),
            content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: FirebaseController.to.getRMsImages(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final docs = snapshot.data?.docs;
                      return GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                          itemCount: docs?.length,
                          itemBuilder: (BuildContext ctx, index) {
                            final image = docs?[index].data();
                            final pictureUrl = image?['pictureUrl'];

                            return GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, pictureUrl);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(pictureUrl!)),
                                  ),
                                ));
                          });
                    } else {
                      return SizedBox();
                    }
                  },
                )),
          );
        });
  }
}
