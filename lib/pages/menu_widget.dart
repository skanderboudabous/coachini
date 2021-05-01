import 'package:coachini/services/firebase.-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'exercices.dart';
import 'login.dart';

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
              'Nick',
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
            Get.find<FirebaseService>().logout().then((value) =>  Get.to(LoginScreen()));
            break;
          case "Exercices":
            Get.to(ExercicesPage());
            break;
        }
      });
}
