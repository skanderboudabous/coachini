import 'package:coachini/models/techniques-preparation-mentale.dart';
import 'package:coachini/pages/techniques-preparation-mentale-detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TechniquesPreparationMentaleCard extends StatefulWidget {
  final TechniquesPreparationMentale techniquesPreparationMentale;
  final String? userId;
  final VoidCallback ? onPressed;
  TechniquesPreparationMentaleCard(this.techniquesPreparationMentale,this.userId, {this.onPressed});

  @override
  _TechniquesPreparationMentaleCardState createState() => _TechniquesPreparationMentaleCardState();
}

class _TechniquesPreparationMentaleCardState extends State<TechniquesPreparationMentaleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new TechniquesPreparationMentaleDetailPage(widget.userId,techniquesPreparationMentale: this.widget.techniquesPreparationMentale));
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
              Text(formatDate(widget.techniquesPreparationMentale.date!, [dd, '-', MM, '-', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
