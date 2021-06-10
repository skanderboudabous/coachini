import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/exercices_detail.dart';
import 'package:date_format/date_format.dart';
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
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDate(exercice.dateLim!, [dd, ' - ', MM, ' - ', yyyy]),style: TextStyle(fontSize: 18),),
              Checkbox(
                value: exercice.isDone,
                onChanged:  (bool? value) {
//                  setState(() {
//                    value = !value;
//                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
