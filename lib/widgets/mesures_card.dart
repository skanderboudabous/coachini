import 'package:coachini/models/mesure.dart';
import 'package:coachini/pages/mesures_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MesuresCard extends StatelessWidget {
  final Mesure mesure;
  final String? userId;
  MesuresCard(this.mesure,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new MesuresDetailPage(userId,mesure: this.mesure));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(mesure.date.toString(),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
