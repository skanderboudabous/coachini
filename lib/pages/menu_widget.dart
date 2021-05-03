import 'package:coachini/models/objectif.dart';
import 'package:coachini/pages/objectif.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'edit_profile.dart';
import 'exercices.dart';
import 'login.dart';
import 'mesures.dart';
import 'morphologie.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);

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
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 45,
//              backgroundImage: AssetImage('assets/images/user_profile.jpg'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Get.find<FirebaseService>().user?.firstName??'',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'BalsamiqSans'),
            ),
            SizedBox(
              height: 5,
            ),
            sliderItem('Profile', Icons.person_rounded,),
            sliderItem('Type de morphologie', Icons.accessibility),
            sliderItem('Objectif', Icons.assistant_photo),
            sliderItem('Mesures', Icons.assignment),
            sliderItem('1RM', Icons.assignment),
            sliderItem('Exercices', Icons.fitness_center),
            sliderItem('Regime Alimentaire', Icons.food_bank),
            sliderItem('Suivi Nutritionnel', Icons.fastfood),
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
            Get.find<FirebaseService>().logout().then((value) =>  Get.to(LoginPage()));
            break;
          case "Exercices":
            Get.to(ExercicesPage());
            break;
          case "Objectif":
            Get.to(ObjectifPage());
            break;
          case "Type de morphologie":
            Get.to(MorphologiePage());
            break;
          case "Profile":
            Get.to(EditProfilePage());
            break;
          case "Mesures":
            Get.to(MesuresPage());
            break;
        }
      });
}
