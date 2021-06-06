import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MesuresList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _MesuresListState createState() => _MesuresListState();
}

class _MesuresListState extends State<MesuresList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mesures")),
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
                            buttonLabel: "taille",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Tour Taille",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Tour Hanche",
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
                            buttonLabel: "Lancé médecine ball",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Vitesse de démarrage",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Vitesse max",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Five Jump Test",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Squat Jump",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Agilité",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Repétition Max Pompe",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Repétition Max Abdo",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Temps Limite Gainage",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Temps Limite Gainage Squat",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "souplesse",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Counter movement Jump",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Drop Jump",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Vo2Max",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Test 6 minutes de marche",
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
