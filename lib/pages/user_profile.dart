import 'package:age_calculator/age_calculator.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/online_image.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  final String? id = Get.parameters['id'];

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User")),
      body: SingleChildScrollView(
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
                  Center(
                    child: OnlineImage(
                      user?.pictureUrl,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('${user?.firstName} ${user?.lastName}'),
                  Text("Age:  "+'${AgeCalculator.age(user?.birthday??DateTime.now()).years}'),
                  Text("email:  "+'${user?.email}'),
                  Text("Phone:  "+'${user?.phone} '),
                  SizedBox(height: 20,),
                  user?.isSubscribed == true
                      ?Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryButton(
                          onPressed: () {

                          },
                          buttonLabel: "Objectif",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 10,),
                        PrimaryButton(
                          onPressed: () {

                          },
                          buttonLabel: "Type de Morphologie",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 10,),
                        PrimaryButton(
                          onPressed: () {

                        },
                          buttonLabel: "Mesures",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 10,),
                        PrimaryButton(
                          onPressed: () {

                          },
                          buttonLabel: "Exercices",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 10,),
                        PrimaryButton(
                          onPressed: () {

                          },
                          buttonLabel: "RM",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 10,),
                        PrimaryButton(
                          onPressed: () {

                          },
                          buttonLabel: "Suivie Nutritionnel",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 10,),
                        PrimaryButton(
                          onPressed: () {

                          },
                          buttonLabel: "Suivie Mentale",
                          fontSize: 14,
                          bgColor: Colors.lightBlue,
                          width: 150,
                          height: 50,),
                        SizedBox(height: 20,),
                      ])
                      : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                      ]),
                ]),
          );
        }
        return Loader();
          },
        ),
      ),
    );
  }
}
