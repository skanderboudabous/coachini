import 'package:coachini/models/adherant.dart';
import 'package:coachini/pages/collections-list.dart';
import 'package:coachini/pages/composition_corporelle.dart';
import 'package:coachini/pages/objectif.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/pages/regime-alimentaire.dart';
import 'package:coachini/pages/rm.dart';
import 'package:coachini/pages/suivi_entrainement.dart';
import 'package:coachini/pages/suivie-mentale.dart';
import 'package:coachini/pages/suivie-nutritionnel.dart';
import 'package:coachini/pages/techniques-preparation-mentale.dart';
import 'package:coachini/widgets/online_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'about.dart';
import 'edit_profile.dart';
import 'exercices.dart';
import 'mesures.dart';
import 'morphologie.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);
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
            FutureBuilder<Adherant>(
              future: FirebaseController.to.getFirestoreUser(),
              builder:(context,snapshot){
                if(!snapshot.hasData){
                  return new CircularProgressIndicator();
                } else{
                  return OnlineImage(
                   snapshot.data?.pictureUrl,
                    size: 25,
                    width: 100,
                    height: 100,
                  );
                }
              }
            ),
            SizedBox(
              height: 20,
            ),
            GetX<FirebaseController>(
              builder: (fb) {
                return Text(
                  fb.firestoreUser.value?.firstName ?? '',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'BalsamiqSans'),
                );
              },
              init: FirebaseController(),
            ),
            SizedBox(
              height: 5,
            ),
            sliderItem(
              'Profile',
              Icons.person_rounded,
            ),
            sliderItem('Type de morphologie', Icons.accessibility),
            sliderItem('Objectif', Icons.assistant_photo),
            sliderItem('Mesures', Icons.assignment),
            sliderItem('1RM', Icons.assignment),
            sliderItem('Exercices', Icons.assignment_turned_in_outlined),
            sliderItem('Régime alimentaire', Icons.food_bank),
            sliderItem('Suivi nutritionnel', Icons.fastfood),
            sliderItem('Suivi mentale', Icons.assignment),
            sliderItem('Techniques de préparation mentale', Icons.assignment),
            sliderItem('Suivi entrainement', Icons.fitness_center),
            sliderItem('Composition corporelle', Icons.accessibility),
            sliderItem('Statistiques', Icons.graphic_eq),
            sliderItem('About', Icons.info),
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
        switch (title) {
          case "LogOut":
            Get.find<FirebaseController>().logout();
            break;
          case "Exercices":
            Get.to(ExercicesPage(FirebaseController.currentId));
            break;
          case "Objectif":
            Get.to(ObjectifPage(FirebaseController.currentId));
            break;
          case "Type de morphologie":
            Get.to(MorphologiePage(FirebaseController.currentId));
            break;
          case "Profile":
            Get.to(EditProfilePage());
            break;
          case "1RM":
            Get.to(RMsPage(FirebaseController.currentId));
            break;
          case "Mesures":
            Get.to(MesuresPage(FirebaseController.currentId));
            break;
          case "Suivi mentale":
            Get.to(SuivieMentalePage(FirebaseController.currentId));
            break;
          case "Suivi nutritionnel":
            Get.to(SuivieNutritionnelPage(FirebaseController.currentId));
            break;
           case "Régime alimentaire":
            Get.to(RegimeAlimentairePage(FirebaseController.currentId));
            break;
          case "Suivi entrainement":
            Get.to(SuiviEntrainementPage(FirebaseController.currentId));
            break;
          case "Composition corporelle":
            Get.to(CompositionCorporellePage(FirebaseController.currentId));
            break;
            case "Techniques de préparation mentale":
            Get.to(TechniquesPreparationMentalePage(FirebaseController.currentId));
            break;
          case "About":
            Get.to(AboutPage());
            break;
          case "Statistiques":
            Get.to(CollectionList());
            break;
        }
      });
}
