import 'package:coachini/models/suivi-entrainement.dart';
import 'package:coachini/pages/suivi_entrainement_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuiviEntrainementCard extends StatefulWidget {
  final SuiviEntrainement suiviEntrainement;
  final String? userId;
  final VoidCallback ? onPressed;
  SuiviEntrainementCard(this.suiviEntrainement,this.userId, {this.onPressed});

  @override
  _SuiviEntrainementCardState createState() => _SuiviEntrainementCardState();
}

class _SuiviEntrainementCardState extends State<SuiviEntrainementCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new SuiviEntrainementDetailPage(widget.userId,suiviEntrainement: this.widget.suiviEntrainement));
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
              Text(formatDate(widget.suiviEntrainement.date!, [dd, '-', MM, '-', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
