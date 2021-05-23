import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/exercices.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ExerciceDetailPage extends StatefulWidget {
  final String? userId;
  final Exercice? exercice;
  ExerciceDetailPage(this.userId,{this.exercice});
  @override
  _ExerciceDetailPageState createState() => _ExerciceDetailPageState();
}

class _ExerciceDetailPageState extends State<ExerciceDetailPage> {
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
        title: Text("Execrcice"),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Get.to(ExercicesPage(widget.userId));
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
                              name: 'nom',
                              decoration: InputDecoration(
                                  labelText: 'Nom',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              initialValue: widget.exercice?.nom.toString(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              keyboardType: TextInputType.name,
                            ),
                            FormBuilderTextField(
                              name: 'ImageLink',
                              decoration: InputDecoration(
                                  labelText: 'ImageLink',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              initialValue: widget.exercice?.ImageLink.toString(),
                              keyboardType: TextInputType.name,
                            ),
                            FormBuilderTextField(
                              name: 'nbSerie',
                              decoration: InputDecoration(
                                  labelText: 'nbSerie',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.exercice?.nbSerie.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'nbRep',
                              decoration: InputDecoration(
                                  labelText: 'nbRep',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.exercice?.nbRep.toString(),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'repo',
                              decoration: InputDecoration(
                                  labelText: 'repo(sec)',
                                  labelStyle: TextStyle(color: Colors.white)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.exercice?.repo.toString(),
                              keyboardType: TextInputType.number,
                            ),

                          ],
                        ),
                      ),
                    ),
                    absorbing:widget.exercice!=null,
                  ),
                  widget.exercice==null ? Row(
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
                              Exercice exercice=Exercice.fromMap(_formKey.currentState?.value);
                              exercice.dateLim=DateTime.now();
                              await FirebaseController.to.addExercice(exercice, widget.userId!);
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
