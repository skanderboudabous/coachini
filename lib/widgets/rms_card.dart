import 'package:coachini/models/exercice.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/pages/exercices_detail.dart';
import 'package:coachini/pages/rm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RMsCard extends StatelessWidget {
  final RM rm;
  final String? userId;
  RMsCard(this.rm,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new RMsPage(userId,rm: this.rm));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rm.date.toString(),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
