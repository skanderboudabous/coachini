import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivie_nutritionnel_detail.dart';
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
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(suivieNutritionnel.date.toString(),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
