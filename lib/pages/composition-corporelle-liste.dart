import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chart.dart';

class CompositionCorporelleList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _CompositionCorporelleListState createState() => _CompositionCorporelleListState();
}

class _CompositionCorporelleListState extends State<CompositionCorporelleList> {
  final String collectionName="compositionCorporelles";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coposition Corporelle")),
      body: SingleChildScrollView(
        child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"poids", atr: 'poids',collectionName: collectionName,));

                      },
                      buttonLabel: "poids",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Graisse", atr: 'masseGraisse',collectionName: collectionName,));

                      },
                      buttonLabel: "masse Graisse",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Hydrique", atr: 'masseHydrique',collectionName: collectionName,));

                      },
                      buttonLabel: "masse Hydrique",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Musculaire", atr: 'masseMusculaire',collectionName: collectionName,));

                      },
                      buttonLabel: "masse Musculaire",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Osseuse", atr: 'masseOsseuse',collectionName: collectionName,));

                      },
                      buttonLabel: "masse Osseuse",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"imc", atr: 'imc',collectionName: collectionName,));

                      },
                      buttonLabel: "imc",
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
