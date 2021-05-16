import 'package:coachini/models/exercice.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/pages/exercices_detail.dart';
import 'package:coachini/pages/mesures_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ExercicesCard extends StatelessWidget {
  final Exercice exercice;
  final String? userId;
  ExercicesCard(this.exercice,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new ExerciceDetailPage(userId,exercice: this.exercice));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(exercice.dateLim.toString(),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
