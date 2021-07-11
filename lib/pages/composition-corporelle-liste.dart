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
                        Get.to(()=> new ChartPage(title:"poids", atr: 'poids',collectionName: collectionName,));

                      },
                      buttonLabel: "Poids",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Graisseuse", atr: 'masseGraisse',collectionName: collectionName,));

                      },
                      buttonLabel: "Masse graisseuse",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Hydrique", atr: 'masseHydrique',collectionName: collectionName,));

                      },
                      buttonLabel: "Masse hydrique",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Musculaire", atr: 'masseMusculaire',collectionName: collectionName,));

                      },
                      buttonLabel: "Masse musculaire",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"masse Osseuse", atr: 'masseOsseuse',collectionName: collectionName,));

                      },
                      buttonLabel: "Masse osseuse",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"imc", atr: 'imc',collectionName: collectionName,));

                      },
                      buttonLabel: "IMC",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"pli cutané bicipital", atr: 'pliCutaneBicipital',collectionName: collectionName,));

                      },
                      buttonLabel: "pli cutané bicipital",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"pli cutané tricipital", atr: 'pliCutaneTricipital',collectionName: collectionName,));

                      },
                      buttonLabel: "pli cutané tricipital",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"pli cutané sous-scapulaire", atr: 'pliCutaneSousScapulaire',collectionName: collectionName,));

                      },
                      buttonLabel: "pli cutané sous-scapulaire",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,),
                    SizedBox(height: 10,),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(()=> new ChartPage(title:"pli cutané supra-iliaque", atr: 'pliCutaneSupraIliaque',collectionName: collectionName,));

                      },
                      buttonLabel: "pli cutané supra-iliaque",
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
