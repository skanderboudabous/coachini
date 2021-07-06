import 'package:coachini/models/mesure.dart';
import 'package:coachini/pages/mesures_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MesuresCard extends StatefulWidget {
  final Mesure mesure;
  final String? userId;
  final VoidCallback ? onPressed;
  MesuresCard(this.mesure,this.userId, {this.onPressed});

  @override
  _MesuresCardState createState() => _MesuresCardState();
}

class _MesuresCardState extends State<MesuresCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new MesuresDetailPage(widget.userId,mesure: this.widget.mesure));
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
              Text(formatDate(widget.mesure.date!, [dd, ' - ', MM, ' - ', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
