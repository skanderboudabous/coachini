import 'package:coachini/models/rm.dart';
import 'package:coachini/pages/rm_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RMsCard extends StatefulWidget {
  final RM rm;
  final String? userId;
  final VoidCallback ? onPressed;
  RMsCard(this.rm,this.userId, {this.onPressed});

  @override
  _RMsCardState createState() => _RMsCardState();
}

class _RMsCardState extends State<RMsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new RMDetailPage(widget.userId,rm: this.widget.rm));
      },
      onLongPress: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.rm.name!+" "+   formatDate(widget.rm.date!,
                [dd, '-', MM, '-', yyyy]),
                style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
