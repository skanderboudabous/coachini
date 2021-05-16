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
                              name: 'Poid',
                              decoration: InputDecoration(
                                labelText: 'Poids',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              initialValue: widget.mesure?.poid.toString(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'taille',
                              decoration: InputDecoration(
                                labelText: 'taille',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.taille.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'IMC',
                              decoration: InputDecoration(
                                labelText: 'IMC',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.IMC.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'FC',
                              decoration: InputDecoration(
                                labelText: 'FC repo',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.FC.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'masseMuscle',
                              decoration: InputDecoration(
                                labelText: 'Masse Musculaire',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.masseMuscle.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'masseGraisse',
                              decoration: InputDecoration(
                                labelText: 'Masse Graisse',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.masseGraisse.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'stresse',
                              decoration: InputDecoration(
                                labelText: 'Stress',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.stresse.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'oxygene',
                              decoration: InputDecoration(
                                labelText: 'SpO2',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.oxygene.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'tourTaille',
                              decoration: InputDecoration(
                                labelText: 'Tour Taille',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tourTaille.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'TourHancher',
                              decoration: InputDecoration(
                                labelText: 'Tour Hanche',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tourHancher.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'VMA',
                              decoration: InputDecoration(
                                labelText: 'VMA',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.VMA.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'LMD',
                              decoration: InputDecoration(
                                labelText: 'Lancé medecine ball',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.LMD.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'cordination',
                              decoration: InputDecoration(
                                labelText: 'Cordination',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.cordination.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'vitesseDmg',
                              decoration: InputDecoration(
                                labelText: 'Vitesse de demarrage',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.vitesseDmg.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'vitesseMax',
                              decoration: InputDecoration(
                                labelText: 'Vitesse max',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.vitesseMax.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'fiveJumpTest',
                              decoration: InputDecoration(
                                labelText: 'Five Jump Test',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.fiveJumpTest.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'squatJump',
                              decoration: InputDecoration(
                                labelText: 'Squat Jump',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.squatJump.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'agilite',
                              decoration: InputDecoration(
                                labelText: 'Agilite',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.agilite.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'repMaxPompe',
                              decoration: InputDecoration(
                                labelText: 'Repo Max Pompe',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.repMaxPompe.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'repMaxAbd',
                              decoration: InputDecoration(
                                labelText: 'Rep Max Abdo',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.repMaxAbd.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'tempsLimiteGain',
                              decoration: InputDecoration(
                                labelText: 'Temps Limite Gain',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tempsLimiteGain.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'tempsLimiteGainSquat',
                              decoration: InputDecoration(
                                labelText: 'Temps Limite Gain Squat',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.tempsLimiteGainSquat.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'RPE',
                              decoration: InputDecoration(
                                labelText: 'RPE',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.mesure?.RPE.toString(),
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
