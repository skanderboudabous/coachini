import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/composition-corporelle.dart';
import 'package:coachini/pages/composition_corporelle.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CompositionCorporelleDetailPage extends StatefulWidget {
  final String? userId;
  final CompositionCorporelle? compositionCorporelle;
  CompositionCorporelleDetailPage(this.userId,{this.compositionCorporelle});
  @override
  _CompositionCorporelleDetailPageState createState() => _CompositionCorporelleDetailPageState();
}

class _CompositionCorporelleDetailPageState extends State<CompositionCorporelleDetailPage> {
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
        title: Text("Composition Corporelle",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Get.to(CompositionCorporellePage(widget.userId));
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
                              name: 'poids',
                              decoration: InputDecoration(
                                  labelText: 'poids',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.compositionCorporelle?.poids.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),

                            FormBuilderTextField(
                              name: 'masseGraisse',
                              decoration: InputDecoration(
                                  labelText: 'masseGraisse',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.compositionCorporelle?.masseGraisse.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),

                            FormBuilderTextField(
                              name: 'masseHydrique',
                              decoration: InputDecoration(
                                  labelText: 'masseHydrique',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.compositionCorporelle?.masseHydrique.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'masseMusculaire',
                              decoration: InputDecoration(
                                  labelText: 'masseMusculaire',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.compositionCorporelle?.masseMusculaire.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'masseOsseuse',
                              decoration: InputDecoration(
                                  labelText: 'masseOsseuse',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.compositionCorporelle?.masseOsseuse.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                            FormBuilderTextField(
                              name: 'imc',
                              decoration: InputDecoration(
                                  labelText: 'imc',
                                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                              ]),
                              initialValue: widget.compositionCorporelle?.imc.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                            ),
                           ],
                        ),
                      ),
                    ),
                    absorbing:widget.compositionCorporelle!=null,
                  ),
                  widget.compositionCorporelle==null ? Row(
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
                              CompositionCorporelle compositionCorporelle=CompositionCorporelle.fromMap(_formKey.currentState?.value);
                              compositionCorporelle.date=DateTime.now();
                              await FirebaseController.to.addCompositionCorporelle(compositionCorporelle, widget.userId!);
                              Get.to(CompositionCorporellePage(widget.userId));
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
