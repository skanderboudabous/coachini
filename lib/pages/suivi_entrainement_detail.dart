import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/suivi-entrainement.dart';
import 'package:coachini/pages/suivi_entrainement.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SuiviEntrainementDetailPage extends StatefulWidget {
  final String? userId;
  final SuiviEntrainement? suiviEntrainement;

  SuiviEntrainementDetailPage(this.userId, {this.suiviEntrainement});

  @override
  _SuiviEntrainementDetailPageState createState() =>
      _SuiviEntrainementDetailPageState();
}

class _SuiviEntrainementDetailPageState
    extends State<SuiviEntrainementDetailPage> {
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
        title: Text("Suivie Entrainement"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(SuiviEntrainementPage(widget.userId));
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
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom:55),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AbsorbPointer(
                  absorbing: widget.suiviEntrainement != null,
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          name: 'duree_totale_seance',
                          decoration: InputDecoration(
                              labelText: 'Duree totale séance',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          //************************************
                          initialValue: widget
                              .suiviEntrainement?.duree_totale_seance
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'rythme_cardiaque_moy',
                          decoration: InputDecoration(
                              labelText: 'Rythme cardiaque moyen',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget
                              .suiviEntrainement?.rythme_cardiaque_moy
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'vitesse_moyenne',
                          decoration: InputDecoration(
                              labelText: 'Vitesse moyenne',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget
                              .suiviEntrainement?.vitesse_moyenne
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'nombre_pas',
                          decoration: InputDecoration(
                              labelText: 'Nombre de pas',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue:
                              widget.suiviEntrainement?.nombre_pas.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'distance_parcourue',
                          decoration: InputDecoration(
                              labelText: 'distance parcourue',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget
                              .suiviEntrainement?.distance_parcourue
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'nb_calorie_brule',
                          decoration: InputDecoration(
                              labelText: 'Nombre calories bruleés',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget
                              .suiviEntrainement?.nb_calorie_brule
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'allureMoy',
                          decoration: InputDecoration(
                              labelText: 'Allure Moyenne',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue:
                              widget.suiviEntrainement?.allureMoy.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'cadenceMoy',
                          decoration: InputDecoration(
                              labelText: 'Cadence Moyenne',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue:
                              widget.suiviEntrainement?.cadenceMoy.toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'longuerMoyPas',
                          decoration: InputDecoration(
                              labelText: 'Longueur Moyenne de pas',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          initialValue: widget
                              .suiviEntrainement?.longuerMoyPas
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: widget.suiviEntrainement == null
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
                      if (_formKey.currentState?.validate() == true) {
                        SuiviEntrainement suivie = SuiviEntrainement.fromMap(
                            _formKey.currentState?.value);
                        suivie.date = DateTime.now();
                        await FirebaseController.to
                            .addSuivieEntrainement(suivie, widget.userId!);
                        Get.to(SuiviEntrainementPage(widget.userId));
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
          : SizedBox(),
    );
  }
}
