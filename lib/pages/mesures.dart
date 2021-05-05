import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class MesuresPage extends StatefulWidget {
  @override
  _MesuresPageState createState() => _MesuresPageState();
}

class _MesuresPageState extends State<MesuresPage> {
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
      appBar: AppBar(),
      body: Container(
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
                GestureDetector(
                  onTap: (){
                    if(isAdmin== false)
                    {
                      showLongToast("Please contact the administrator");
                    }
                  },
                  child: AbsorbPointer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            FormBuilderDateTimePicker(
                              name: 'date',
                              // onChanged: _onChanged,
                              inputType: InputType.date,
                              decoration: InputDecoration(
                                labelText: 'Birthday',
                                labelStyle: TextStyle(color: Colors.white)
                              ),

                              // initialValue: DateTime.now(),
                              // enabled: true,
                            ),
                            FormBuilderTextField(
                              name: 'Poid',
                              decoration: InputDecoration(
                                labelText: 'Poids',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
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
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'FC',
                              decoration: InputDecoration(
                                labelText: 'FC',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
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
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'stresse',
                              decoration: InputDecoration(
                                labelText: 'Stresse',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'oxygene',
                              decoration: InputDecoration(
                                labelText: 'Oxygene',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
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
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'LMD',
                              decoration: InputDecoration(
                                labelText: 'LMD',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
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
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ),
                    absorbing: isAdmin == false,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
