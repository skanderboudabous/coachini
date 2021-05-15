import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/mesures_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mesures_detail.dart';
class MesuresPage extends StatefulWidget {
  final String? id;
  MesuresPage(this.id);
  @override
  _MesuresPageState createState() => _MesuresPageState();
}

class _MesuresPageState extends State<MesuresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(child: Icon(Icons.arrow_back),onPressed: (){
          Get.toNamed(AppRoutes.USER_PROFILE+"?id="+widget.id!);
        },),
      ),
      body: FutureBuilder(
          future: FirebaseController.to.getUserSuivieNutritionnels(id:widget.id),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot>? documents = snapshot.data?.docs;

              return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    final Mesure mesure = Mesure.fromMap(documents?[index]);
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: MesuresCard(mesure,widget.id)
                    );
                  });
            } else {
              return Loader();
            }
          }),
      floatingActionButton:ElevatedButton(child: Icon(Icons.add),onPressed: (){
        Get.to(new MesuresDetailPage(widget.id));
      },),
    );
  }
}
