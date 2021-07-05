import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivie_nutritionnel_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuiviNutritionnelCard extends StatelessWidget {
  final SuivieNutritionnel suivieNutritionnel;
  final String? userId;
  SuiviNutritionnelCard(this.suivieNutritionnel,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new SuivieNutritionnelDetailPage(userId,suivieNutritionnel: this.suivieNutritionnel));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDate(suivieNutritionnel.date!, [dd, '-', MM, '-', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
