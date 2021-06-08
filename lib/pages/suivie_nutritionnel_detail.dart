import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivie-nutritionnel.dart';
import 'package:coachini/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SuivieNutritionnelDetailPage extends StatefulWidget {
  final String? userId;
  final SuivieNutritionnel? suivieNutritionnel;
  SuivieNutritionnelDetailPage(this.userId,{this.suivieNutritionnel});
  @override
  _SuivieNutritionnelDetailPageState createState() =>
      _SuivieNutritionnelDetailPageState();
}

class _SuivieNutritionnelDetailPageState
    extends State<SuivieNutritionnelDetailPage> {
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
        title: Text("Suivi nutritionnel",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Get.to(SuivieNutritionnelPage(widget.userId));
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
              image: AssetImage("assets/images/bg4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                AbsorbPointer(
                  absorbing: widget.suivieNutritionnel!=null,
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          name: 'apport',
                          decoration: InputDecoration(
                              labelText: 'Apport',
                              labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          //************************************
                          initialValue: widget.suivieNutritionnel?.apport.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'proteine',
                          decoration: InputDecoration(
                              labelText: 'Proteine',
                              labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget.suivieNutritionnel?.proteine.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'glucide',
                          decoration: InputDecoration(
                              labelText: 'Glucide',
                              labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget.suivieNutritionnel?.glucide.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'lipide',
                          decoration: InputDecoration(
                              labelText: 'Lipide',
                              labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget.suivieNutritionnel?.lipide.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                widget.suivieNutritionnel == null ?  Row(
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
                            SuivieNutritionnel suivie=SuivieNutritionnel.fromMap(_formKey.currentState?.value);
                            suivie.date=DateTime.now();
                            await FirebaseController.to.addSuivieNutritionnel(suivie, widget.userId!);
                            Get.to(SuivieNutritionnelPage(widget.userId));
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
                ):
                    SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
