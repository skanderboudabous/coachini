import 'package:coachini/pages/chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ListChartItems extends StatelessWidget {
  const ListChartItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()=>{
              Get.to(()=> new ChartPage(title:"Mesures", atr: 'taille',collectionName: "mesure",))
            }, child: Text("Mesures")),
            ElevatedButton(onPressed: ()=>{
              Get.to(()=> new ChartPage(title:"Suivie Nutritionnels", atr: 'glucide',collectionName: "suivieNutritionnels",))
            }, child: Text("Suivie Nutritionnels"))
          ],
        ),
      ),
    );
  }
}
