import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chart.dart';

class SuiviEntrainementList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _SuiviEntrainementListState createState() => _SuiviEntrainementListState();
}

class _SuiviEntrainementListState extends State<SuiviEntrainementList> {
  final String collectionName="suiviEntrainements";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivi entraînement")),
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
          child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Durée totale séance", atr: 'duree_totale_seance',collectionName: collectionName,));
                        },
                        buttonLabel: "Durée totale séance",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Fréquence cardiaque repos", atr: 'FC',collectionName: collectionName,));
                        },
                        buttonLabel: "Fréquence cardiaque repos",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Fréquence cardiaque moyen", atr: 'rythme_cardiaque_moy',collectionName: collectionName,));
                        },
                        buttonLabel: "Fréquence cardiaque moyen",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"FC max", atr: 'FCmax',collectionName: collectionName,));
                        },
                        buttonLabel: "Fréquence cardiaque max",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Vitesse moyenne", atr: 'vitesse_moyenne',collectionName: collectionName,));
                        },
                        buttonLabel: "Vitesse moyenne",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Nombre de pas", atr: 'nombre_pas',collectionName: collectionName,));
                        },
                        buttonLabel: "Nombre de pas",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"distance parcourue", atr: 'distance_parcourue',collectionName: collectionName,));
                        },
                        buttonLabel: "Distance parcourue",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Nombre calories bruleés", atr: 'nb_calorie_brule',collectionName: collectionName,));
                        },
                        buttonLabel: "Nombre calories bruleés",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Allure Moyenne", atr: 'allureMoy',collectionName: collectionName,));
                        },
                        buttonLabel: "Allure moyenne",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Cadence Moyenne", atr: 'cadenceMoy',collectionName: collectionName,));
                        },
                        buttonLabel: "Cadence moyenne",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Longueur Moyenne de pas", atr: 'longuerMoyPas',collectionName: collectionName,));
                        },
                        buttonLabel: "Longueur moyenne de pas",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"Stress", atr: 'stresse',collectionName: collectionName,));
                        },
                        buttonLabel: "Stress",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"SpO2", atr: 'oxygene',collectionName: collectionName,));
                        },
                        buttonLabel: "SpO2",
                        fontSize: 14,
                        bgColor: Colors.lightBlue,
                        width: 150,
                        height: 50,),
                      SizedBox(height: 10,),
                      PrimaryButton(
                        onPressed: () {
                          Get.to(()=> new ChartPage(title:"RPE", atr: 'RPE',collectionName: collectionName,));
                        },
                        buttonLabel: "RPE",
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
