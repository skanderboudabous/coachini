import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/techniques-preparation-mentale.dart';
import 'package:coachini/pages/techniques-preparation-mentale.dart';
import 'package:coachini/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class TechniquesPreparationMentaleDetailPage extends StatefulWidget {
  final String? userId;
  final TechniquesPreparationMentale? techniquesPreparationMentale;
  TechniquesPreparationMentaleDetailPage(this.userId,{this.techniquesPreparationMentale});
  @override
  _TechniquesPreparationMentaleDetailPageState createState() => _TechniquesPreparationMentaleDetailPageState();
}

class _TechniquesPreparationMentaleDetailPageState extends State<TechniquesPreparationMentaleDetailPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool? isAdmin;

  @override
  void initState() {
    isAdmin = Get.find<FirebaseController>().admin.value;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Techniques de préparation mentale",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Get.to(TechniquesPreparationMentalePage(widget.userId));
        },),
      ),
      body: WillPopScope(
        onWillPop: (){
          return Future.value(false);
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              image: AssetImage("assets/images/bg8.jpg"),
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
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            FormBuilderTextField(
                              name: 'texte',
                              maxLines: 30,
//                              decoration: InputDecoration(
//                                  labelText: 'texte',
//                                  labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 30)
//                                 //labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
//                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              initialValue: widget.techniquesPreparationMentale?.texte.toString(),
                              style: TextStyle(color: Colors.white,fontSize: 25),
                              keyboardType: TextInputType.multiline,
                            ),
                          ],
                        ),
                      ),
                    ),
                    absorbing: isAdmin == false,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton:widget.techniquesPreparationMentale == null ?  Row(
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
                if (_formKey.currentState?.validate() == true) {
                  TechniquesPreparationMentale techniquesPreparationMentale=TechniquesPreparationMentale.fromMap(_formKey.currentState?.value);
                  techniquesPreparationMentale.date=DateTime.now();
                  await FirebaseController.to.addTechniquesPreparationMentale(techniquesPreparationMentale, widget.userId!);
                  Get.to(TechniquesPreparationMentalePage(widget.userId));
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
          :SizedBox(),
    );
  }
}
