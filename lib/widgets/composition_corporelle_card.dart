import 'package:coachini/models/composition-corporelle.dart';
import 'package:coachini/pages/composition_corporelle_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompositionCorporelleCard extends StatelessWidget {
  final CompositionCorporelle compositionCorporelle;
  final String? userId;
  CompositionCorporelleCard(this.compositionCorporelle,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new CompositionCorporelleDetailPage(userId,compositionCorporelle: this.compositionCorporelle));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Text(formatDate(compositionCorporelle.date!, [dd, ' - ', MM, ' - ', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
