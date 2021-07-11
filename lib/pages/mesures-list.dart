import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chart.dart';

class MesuresList extends StatefulWidget {
  @override
  _MesuresListState createState() => _MesuresListState();
}

class _MesuresListState extends State<MesuresList> {
  final String collectionName="mesures";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mesures")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            image: AssetImage("assets/images/bg9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Taille", atr: 'taille',collectionName: collectionName,));

                        },
                        buttonLabel: "Taille",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Tour Taille", atr: 'tourTaille',collectionName: collectionName,));
                        },
                        buttonLabel: "Tour de taille",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Tour Hanche", atr: 'tourHanche',collectionName: collectionName,));
                        },
                        buttonLabel: "Tour de hanche",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"VMA", atr: 'VMA',collectionName: collectionName,));
                        },
                        buttonLabel: "VMA",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Lancé médecine ball", atr: 'LMD',collectionName: collectionName,));
                        },
                        buttonLabel: "Lancé médecine ball",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Vitesse de démarrage", atr: 'vitesseDmg',collectionName: collectionName,));
                        },
                        buttonLabel: "Vitesse de démarrage",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Vitesse max", atr: 'vitesseMax',collectionName: collectionName,));
                        },
                        buttonLabel: "Vitesse max",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Five Jump Test", atr: 'fiveJumpTest',collectionName: collectionName,));
                        },
                        buttonLabel: "Five Jump Test",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Squat Jump", atr: 'squatJump',collectionName: collectionName,));
                        },
                        buttonLabel: "Squat Jump",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Agilité", atr: 'agilite',collectionName: collectionName,));
                        },
                        buttonLabel: "Agilité",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Repétition Max Pompe", atr: 'repMaxPompe',collectionName: collectionName,));
                        },
                        buttonLabel: "Répétition max pompe",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Repétition Max Abdo", atr: 'repMaxAbd',collectionName: collectionName,));
                        },
                        buttonLabel: "Répétition max abdo",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Temps Limite Gainage", atr: 'tempsLimiteGain',collectionName: collectionName,));
                        },
                        buttonLabel: "Temps limite gainage",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Temps Limite Gainage Squat", atr: 'tempsLimiteGainSquat',collectionName: collectionName,));
                        },
                        buttonLabel: "Temps limite gainage squat",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"souplesse", atr: 'souplesse',collectionName: collectionName,));
                        },
                        buttonLabel: "Souplesse",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Counter movement Jump", atr: 'counterMvtJump',collectionName: collectionName,));
                        },
                        buttonLabel: "Counter movement jump",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Drop Jump", atr: 'dropJump',collectionName: collectionName,));
                        },
                        buttonLabel: "Drop Jump",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Vo2Max", atr: 'vo2Max',collectionName: collectionName,));
                        },
                        buttonLabel: "Vo2Max",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Test 6 minutes de marche", atr: 'test6MinMarche',collectionName: collectionName,));
                        },
                        buttonLabel: "Test de marche de 6 minutes",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}
