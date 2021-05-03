import 'package:coachini/models/exercice.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ExerciceCard extends StatefulWidget {
  final Exercice exercice;
  ExerciceCard({required this.exercice});
  @override
  _ExerciceCardState createState() => _ExerciceCardState();
}

class _ExerciceCardState extends State<ExerciceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.exercice.id.toString()),
          Text(widget.exercice.nom.toString()),
          MaterialButton(
              child : Text("aaa"),
                onPressed: (){
                setState(() {
                  widget.exercice.nom="bbbbb";
                  Get.find<FirebaseController>().updateExercice(widget.exercice);

                });
          })
        ],
      ),
    );
  }

}
