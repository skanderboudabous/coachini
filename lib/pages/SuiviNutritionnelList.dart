import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuiviNutritionnelList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _SuiviNutritionnelListState createState() => _SuiviNutritionnelListState();
}

class _SuiviNutritionnelListState extends State<SuiviNutritionnelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivi Nutritionnel")),
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
                            buttonLabel: "Apport",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Proteine",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "Glucide",
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
                            buttonLabel: "Lipide",
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
