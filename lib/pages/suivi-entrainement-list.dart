import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuiviEntrainementList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _SuiviEntrainementListState createState() => _SuiviEntrainementListState();
}

class _SuiviEntrainementListState extends State<SuiviEntrainementList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivi Entrainement")),
      body: WillPopScope(
        onWillPop: (){
          Get.toNamed(AppRoutes.ADMIN);
          return Future.value(false);
        },
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: FirebaseController.to.getUserFromId(id: this.widget.id),
            builder: (context, AsyncSnapshot<Adherant?> snapshot) {
              if (snapshot.hasData) {
                late final user = snapshot.data;
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Duree totale séance",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Rythme cardiaque moyen",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Vitesse moyenne",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "VMA",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Nombre de pas",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "distance parcourue",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Nombre calories bruleés",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Allure Moyenne",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Cadence Moyenne",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Longueur Moyenne de pas",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "FC repos",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Stress",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "SpO2",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "RPE",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                        ]
                    )
                );
              }
              return Loader();
            },
          ),
        ),
      ),
    );
  }
}
