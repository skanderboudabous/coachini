import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompositionCorporelleList extends StatefulWidget {
  final String? id = Get.parameters['id'];
  @override
  _CompositionCorporelleListState createState() => _CompositionCorporelleListState();
}

class _CompositionCorporelleListState extends State<CompositionCorporelleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coposition Corporelle")),
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
                            buttonLabel: "poids",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "masse Graisse",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "masse Hydrique",
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
                            buttonLabel: "masse Musculaire",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "masse Osseuse",
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                            width: 150,
                            height: 50,),
                          SizedBox(height: 10,),
                          PrimaryButton(
                            onPressed: () {},
                            buttonLabel: "imc",
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
