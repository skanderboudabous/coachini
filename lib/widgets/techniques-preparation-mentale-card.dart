import 'package:coachini/models/techniques-preparation-mentale.dart';
import 'package:coachini/pages/techniques-preparation-mentale-detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TechniquesPreparationMentaleCard extends StatelessWidget {
  final TechniquesPreparationMentale techniquesPreparationMentale;
  final String? userId;
  TechniquesPreparationMentaleCard(this.techniquesPreparationMentale,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new TechniquesPreparationMentaleDetailPage(userId,techniquesPreparationMentale: this.techniquesPreparationMentale));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDate(techniquesPreparationMentale.date!, [dd, '-', MM, '-', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
