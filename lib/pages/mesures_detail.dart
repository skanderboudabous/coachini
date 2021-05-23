import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/pages/mesures.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class MesuresDetailPage extends StatefulWidget {
  final String? userId;
  final Mesure? mesure;
  MesuresDetailPage(this.userId,{this.mesure});
  @override
  _MesuresDetailPageState createState() => _MesuresDetailPageState();
}

class _MesuresDetailPageState extends State<MesuresDetailPage> {
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
        title: Text("Mesures"),
        leading: ElevatedButton(child: Icon(Icons.arrow_back),onPressed: (){
          Get.to(MesuresPage(widget.userId));
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
              image: AssetImage("assets/images/bg.jpg"),
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
                              name: 'taille',
                              decoration: InputDecoration(
                                labelText: 'taille',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.taille.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),

                            FormBuilderTextField(
                              name: 'FC',
                              decoration: InputDecoration(
                                labelText: 'FC repos',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.FC.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),

                            FormBuilderTextField(
                              name: 'stresse',
                              decoration: InputDecoration(
                                labelText: 'Stress',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.stresse.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'oxygene',
                              decoration: InputDecoration(
                                labelText: 'SpO2',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.oxygene.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'tourTaille',
                              decoration: InputDecoration(
                                labelText: 'Tour Taille',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tourTaille.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'TourHancher',
                              decoration: InputDecoration(
                                labelText: 'Tour Hanche',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tourHancher.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'VMA',
                              decoration: InputDecoration(
                                labelText: 'VMA',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.VMA.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'LMD',
                              decoration: InputDecoration(
                                labelText: 'Lancé medecine ball',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.LMD.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'cordination',
                              decoration: InputDecoration(
                                labelText: 'Coordination',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.cordination.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'vitesseDmg',
                              decoration: InputDecoration(
                                labelText: 'Vitesse de démarrage',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.vitesseDmg.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'vitesseMax',
                              decoration: InputDecoration(
                                labelText: 'Vitesse max',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.vitesseMax.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'fiveJumpTest',
                              decoration: InputDecoration(
                                labelText: 'Five Jump Test',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.fiveJumpTest.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'squatJump',
                              decoration: InputDecoration(
                                labelText: 'Squat Jump',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.squatJump.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'agilite',
                              decoration: InputDecoration(
                                labelText: 'Agilité',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.agilite.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'repMaxPompe',
                              decoration: InputDecoration(
                                labelText: 'Repétition Max Pompe',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.repMaxPompe.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'repMaxAbd',
                              decoration: InputDecoration(
                                labelText: 'Repétition Max Abdo',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.repMaxAbd.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'tempsLimiteGain',
                              decoration: InputDecoration(
                                labelText: 'Temps Limite Gainage',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tempsLimiteGain.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'tempsLimiteGainSquat',
                              decoration: InputDecoration(
                                labelText: 'Temps Limite Gainage Squat',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tempsLimiteGainSquat.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'RPE',
                              decoration: InputDecoration(
                                labelText: 'RPE',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.RPE.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'souplesse',
                              decoration: InputDecoration(
                                labelText: 'souplesse',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.souplesse.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'counterMvtJump',
                              decoration: InputDecoration(
                                labelText: 'Counter movement Jump',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.counterMvtJump.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'dropJump',
                              decoration: InputDecoration(
                                labelText: 'Drop Jump',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.dropJump.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'vo2Max',
                              decoration: InputDecoration(
                                labelText: 'Vo2Max',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.vo2Max.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                             FormBuilderTextField(
                              name: 'test6MinMarche',
                              decoration: InputDecoration(
                                labelText: 'Test 6 minutes de marche',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.test6MinMarche.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),

                          ],
                        ),
                      ),
                    ),
                    absorbing:widget.mesure!=null,
                  ),
                  widget.mesure==null ? Row(
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
                              Mesure mesure=Mesure.fromMap(_formKey.currentState?.value);
                              mesure.date=DateTime.now();
                              await FirebaseController.to.addMesure(mesure, widget.userId!);
                              Get.to(MesuresPage(widget.userId));
                            } else {
                              showLongToast("Validation failed");
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
                  ) : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
