import 'package:coachini/pages/add_exercice_image.dart';
import 'package:coachini/pages/add_rm_image.dart';
import 'package:coachini/pages/composition_corporelle.dart';
import 'package:coachini/pages/objectif.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/pages/rm.dart';
import 'package:coachini/pages/suivi_entrainement.dart';
import 'package:coachini/pages/suivie-mentale.dart';
import 'package:coachini/pages/suivie-nutritionnel.dart';
import 'package:coachini/widgets/online_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'edit_profile.dart';
import 'exercices.dart';
import 'mesures.dart';
import 'mesures_detail.dart';
import 'morphologie.dart';

class MenuWidgetAdmin extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidgetAdmin({Key? key, this.onItemClick}) : super(key: key);
//  final String? id=

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            OnlineImage(FirebaseController.to.firestoreUser.value?.pictureUrl,size: 25,width: 100,height: 100,),
            SizedBox(
              height: 20,
            ),
            GetX<FirebaseController>(builder: (fb){
              return Text(
                fb.firestoreUser.value?.firstName??'',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'BalsamiqSans'),
              );
            },init: FirebaseController(),),
            SizedBox(
              height: 5,
            ),
            sliderItem('Images RM', Icons.person_rounded,),
            sliderItem('Images Exercices', Icons.accessibility),
            sliderItem('LogOut', Icons.arrow_back_ios)
          ],
        ),
      ),
    );
  }

  Widget sliderItem(String title, IconData icons) => ListTile(
      title: Text(
        title,
        style:
        TextStyle(color: Colors.black, fontFamily: 'BalsamiqSans_Regular'),
      ),
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      onTap: () {
        onItemClick!(title);
        switch (title){
          case "LogOut":
            Get.find<FirebaseController>().logout();
            break;
          case "Images Exercices":
            Get.to(AddExerciceImage());
            break;
          case "Images RM":
            Get.to(AddRmImage());
            break;
        }
      });
}
