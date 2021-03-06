import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/exercices.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ExerciceDetailPage extends StatefulWidget {
  final String? userId;
  final Exercice? exercice;

  ExerciceDetailPage(this.userId, {this.exercice});

  @override
  _ExerciceDetailPageState createState() => _ExerciceDetailPageState();
}

class _ExerciceDetailPageState extends State<ExerciceDetailPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool? isAdmin;
  String? pictureUrl;

  @override
  void initState() {
    isAdmin = Get.find<FirebaseController>().admin.value;
    if (widget.exercice != null) {
      print(widget.exercice);
      setState(() {
        this.pictureUrl=widget.exercice!.pictureUrl;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Execrcice",
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
              image: AssetImage("assets/images/bg2.jpg"),
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
                                        // decoration: BoxDecoration(
                                        //   image: DecorationImage(
                                        //       fit: BoxFit.cover,
                                        //       image: NetworkImage(pictureUrl!)),
                                        // ),
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    placeholder: AssetImage("assets/images/bg.jpg") ,
                                    image: NetworkImage(pictureUrl!),
                                  ),
                                      )),
                            FormBuilderTextField(
                              name: 'nom',
                              decoration: InputDecoration(
                                  labelText: 'Nom',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                                  initialValue: widget.exercice?.nom.toString(),
                                  validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                              ]),
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            FormBuilderTextField(
                              name: 'nbSerie',
                              decoration: InputDecoration(
                                  labelText: 'Nombre de series',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.exercice?.nbSerie.toString(),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                            ),
                            FormBuilderTextField(
                              name: 'nbRep',
                              decoration: InputDecoration(
                                  labelText: 'Nombre de r??p??titions',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.exercice?.nbRep.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'repo',
                              decoration: InputDecoration(
                                  labelText: 'Temps de r??cup??ration (sec)',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.exercice?.repo.toString(),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                            ),
                            FormBuilderTextField(
                              name: 'charge',
                              decoration: InputDecoration(
                                  labelText: 'Charge',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              initialValue: widget.exercice?.charge.toString(),
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.white),
                            ),
                            FormBuilderDateTimePicker(
                              name: 'dateLim',
                              // onChanged: _onChanged,
                              inputType: InputType.date,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              decoration: InputDecoration(
                                  labelText: 'Date Limite',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),

                              initialValue: widget.exercice?.dateLim,
                              style: TextStyle(color: Colors.white),
                              // initialValue: DateTime.now(),
                              // enabled: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    absorbing: widget.exercice != null,
                  ),
                  widget.exercice == null
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
                                    Exercice exercice = Exercice.fromMap(
                                        _formKey.currentState?.value);
                                    exercice.date=DateTime.now();
                                    exercice.isDone=false;
                                    exercice.pictureUrl = pictureUrl;
                                    await FirebaseController.to
                                        .addExercice(exercice, widget.userId!);
                                    Get.to(ExercicesPage(widget.userId));
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
                  future: FirebaseController.to.getExercicesImages(),
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
