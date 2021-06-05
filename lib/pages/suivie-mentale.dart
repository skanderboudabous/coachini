import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:get/get.dart';
class SuivieMentalePage extends StatefulWidget {
  final String? userId;
  SuivieMentalePage(this.userId);
  @override
  _SuivieMentalePageState createState() => _SuivieMentalePageState();
}

class _SuivieMentalePageState extends State<SuivieMentalePage> {
  var _key1 = GlobalKey<FlutterRadioGroupState>();
  var _key2 = GlobalKey<FlutterRadioGroupState>();
  var _key3 = GlobalKey<FlutterRadioGroupState>();
  var _key4 = GlobalKey<FlutterRadioGroupState>();
  var _key5 = GlobalKey<FlutterRadioGroupState>();
  var _key6 = GlobalKey<FlutterRadioGroupState>();
  var _key7 = GlobalKey<FlutterRadioGroupState>();

  var _listBienEtre = ["1", "2", "3","4","5"];
  var _indexBienEtre = -1;
  var _listPositivite = ["1", "2", "3","4","5"];
  var _indexPositivite = -1;
  var _listNegativite = ["1", "2", "3","4","5"];
  var _indexNegativite = -1;
  var _listDepression = ["1", "2", "3","4","5"];
  var _indexDepression = -1;
  var _listAnxiete = ["1", "2", "3","4","5"];
  var _indexAnxiete = -1;
  var _listStress = ["1", "2", "3","4","5"];
  var _indexStress = -1;
  var _listNiveauFatigue = ["1", "2", "3","4","5"];
  var _indexNiveauFatigue = -1;

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
      appBar: AppBar(
        title: Text("Suivi Mentale",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  if(isAdmin== false)
                  {
                    showShortToast("Please contact the administrator");
                  }
                },
                child: AbsorbPointer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          FlutterRadioGroup(
                              key: _key1,
                              titles: _listBienEtre,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexBienEtre,
                              label: "Bien Être",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexBienEtre = index!;
                                });
                              }),
                          SizedBox(height: 10,),
                          FlutterRadioGroup(
                              key: _key2,
                              titles: _listPositivite,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexPositivite,
                              label: "Positivité",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexPositivite = index!;
                                });
                              }),
                          SizedBox(height: 10,),
                          FlutterRadioGroup(
                              key: _key3,
                              titles: _listNegativite,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexNegativite,
                              label: "Negativité",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexNegativite = index!;
                                });
                              }),
                          SizedBox(height: 10,),
                          FlutterRadioGroup(
                              key: _key4,
                              titles: _listDepression,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexDepression,
                              label: "Dépression",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexDepression = index!;
                                });
                              }),
                          SizedBox(height: 10,),
                          FlutterRadioGroup(
                              key: _key5,
                              titles: _listAnxiete,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexAnxiete,
                              label: "Anxiété",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexAnxiete = index!;
                                });
                              }),
                          SizedBox(height: 10,),
                          FlutterRadioGroup(
                              key: _key6,
                              titles: _listStress,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexStress,
                              label: "Stress",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexStress = index!;
                                });
                              }),
                          SizedBox(height: 10,),
                          FlutterRadioGroup(
                              key: _key7,
                              titles: _listNiveauFatigue,
                              labelStyle: TextStyle(color: Colors.pink),
                              defaultSelected: _indexNiveauFatigue,
                              label: "Niveau général de fatigue",
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                setState(() {
                                  _indexNiveauFatigue = index!;
                                });
                              }),

                        ],
                      ),
                    ),
                  ),
                  absorbing: isAdmin == false,
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
                color: Theme.of(context).accentColor,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState?.save();
                  if (_formKey.currentState?.validate() == true) {
                    print(_formKey.currentState?.value);
                  } else {
                    print("validation failed");
                  }
                },
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
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
            SizedBox(width: 20,),
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
                color: Theme.of(context).accentColor,
                child: Text(
                  "Links",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState?.reset();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
