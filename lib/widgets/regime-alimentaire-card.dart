import 'package:coachini/models/regime-alimentaire.dart';
import 'package:coachini/pages/regime-alimentaire-detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegimeAlimentaireCard extends StatelessWidget {
  final RegimeAlimentaire regimeAlimentaire;
  final String? userId;
  RegimeAlimentaireCard(this.regimeAlimentaire,this.userId);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(new RegimeAlimentaireDetailPage(userId,regimeAlimentaire: this.regimeAlimentaire));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDate(regimeAlimentaire.date!, [dd, ' - ', MM, ' - ', yyyy]),style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
