import 'package:coachini/pages/suivi-nutritionnel-list.dart';
import 'package:coachini/pages/composition-corporelle-liste.dart';
import 'package:coachini/pages/mesures-list.dart';
import 'package:coachini/pages/suivi-entrainement-list.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionList extends StatefulWidget {
  final String? id = Get.parameters['id'];

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Collection",textAlign: TextAlign.center,)),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      onPressed: () {
                        Get.to(MesuresList());
                      },
                      buttonLabel: "Mesure",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(CompositionCorporelleList());
                      },
                      buttonLabel: "Composition corporelle",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(SuiviEntrainementList());
                      },
                      buttonLabel: "Suivi entrainement",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        Get.to(SuiviNutritionnelList());
                      },
                      buttonLabel: "Suivi nutritionnel",
                      fontSize: 14,
                      bgColor: Colors.lightBlue,
                      width: 150,
                      height: 50,
                    ),
                  ]),
            )),
      ),
    );
  }
}
