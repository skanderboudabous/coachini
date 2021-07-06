import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivie_nutritionnel_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuiviNutritionnelCard extends StatefulWidget {
  final SuivieNutritionnel suivieNutritionnel;
  final String? userId;
  final VoidCallback ? onPressed;
  SuiviNutritionnelCard(this.suivieNutritionnel,this.userId, {this.onPressed});

  @override
  _SuiviNutritionnelCardState createState() => _SuiviNutritionnelCardState();
}

class _SuiviNutritionnelCardState extends State<SuiviNutritionnelCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new SuivieNutritionnelDetailPage(widget.userId,suivieNutritionnel: this.widget.suivieNutritionnel));
      },
      onLongPress: widget.onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDate(widget.suivieNutritionnel.date!, [dd, '-', MM, '-', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
