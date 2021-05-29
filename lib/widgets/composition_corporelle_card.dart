import 'package:coachini/models/composition-corporelle.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/pages/composition_corporelle.dart';
import 'package:coachini/pages/composition_corporelle_detail.dart';
import 'package:coachini/pages/mesures_detail.dart';
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
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(compositionCorporelle.date.toString(),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}