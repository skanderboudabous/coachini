import 'package:coachini/models/rm.dart';
import 'package:coachini/pages/rm.dart';
import 'package:coachini/pages/rm_detail.dart';
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
        Get.to(new RMDetailPage(userId,rm: this.rm));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        height: 50,
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
