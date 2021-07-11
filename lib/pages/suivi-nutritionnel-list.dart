
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chart.dart';

class SuiviNutritionnelList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _SuiviNutritionnelListState createState() => _SuiviNutritionnelListState();
}

class _SuiviNutritionnelListState extends State<SuiviNutritionnelList> {
  final String collectionName="suivieNutritionnels";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivi nutritionnel")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            image: AssetImage("assets/images/bg9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      onPressed: () {
                         Get.to(()=> new ChartPage(title:"Quantité de calories recommandé", atr: 'qteCalRec',collectionName: collectionName,));

                      },
                      buttonLabel: "Quantité de calories recommandé",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                         Get.to(()=> new ChartPage(title:"Métabolisme de base", atr: 'metabolisme',collectionName: collectionName,));

                      },
                      buttonLabel: "Métabolisme de base",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                         Get.to(()=> new ChartPage(title:"Dépense énergétique", atr: 'depEnergy',collectionName: collectionName,));

                      },
                      buttonLabel: "Dépense énergétique",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                         Get.to(()=> new ChartPage(title:"Proteine", atr: 'proteine',collectionName: collectionName,));

                      },
                      buttonLabel: "Proteine",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                         Get.to(()=> new ChartPage(title:"Glucide", atr: 'glucide',collectionName: collectionName,));

                      },
                      buttonLabel: "Glucide",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                         Get.to(()=> new ChartPage(title:"Lipide", atr: 'lipide',collectionName: collectionName,));

                      },
                      buttonLabel: "Lipide",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                  ]
              ),
            )
        ),
      ),
    );
  }
}
