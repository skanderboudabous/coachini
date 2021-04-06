import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/exercices.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExercicePage extends StatefulWidget {
  @override
  _AddExercicePageState createState() => _AddExercicePageState();
}

class _AddExercicePageState extends State<AddExercicePage> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Exercice exercice=new Exercice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
                child: Column(
              children: [
                TextFormField(
                  onSaved: (value){
                    setState(() {
                      exercice.nom=value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
                TextFormField(
                  onSaved: (value){
                    setState(() {
                      exercice.nbSerie=int.parse(value.toString());
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Nombre de serie'),
                ),
                TextFormField(
                  onSaved: (value){
                    setState(() {
                      exercice.nbRep=int.parse(value.toString());
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Nombre de rep'),
                ),
                TextFormField(
                  onSaved: (value){
                    setState(() {
                      exercice.repo=int.parse(value.toString());
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Repo'),
                ),
              ],
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add)
      ,onPressed: () {
        final form = formKey.currentState;
        if(form!=null)
          {
            if (form.validate()) {
              form.save();
              print(exercice);
              Get.find<FirebaseService>().addExercice(exercice).then((value) =>  Get.to(ExercicesPage()));



            }
          }

      },),
    );
  }
}
