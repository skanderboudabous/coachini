import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivie_nutritionnel_detail.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/suivi_nutritionnel_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SuivieNutritionnelPage extends StatefulWidget {
  final String? id;
  SuivieNutritionnelPage(this.id);
  @override
  _SuivieNutritionnelPageState createState() => _SuivieNutritionnelPageState();
}

class _SuivieNutritionnelPageState extends State<SuivieNutritionnelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(child: Icon(Icons.arrow_back),onPressed: (){
          Get.toNamed(AppRoutes.USER_PROFILE+"?id="+widget.id!);
        },),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.toNamed(AppRoutes.USER_PROFILE+"?id="+widget.id!);
          return Future.value(false);
        },
        child: FutureBuilder(
            future: FirebaseController.to.getUserSuivieNutritionnels(id:widget.id),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot>? documents = snapshot.data?.docs;

                return ListView.builder(
                    itemCount: documents?.length,
                    itemBuilder: (context, index) {
                      final SuivieNutritionnel suivieNutritionnel = SuivieNutritionnel.fromMap(documents?[index]);
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: SuiviNutritionnelCard(suivieNutritionnel,widget.id)
                      );
                    });
              } else {
                return Loader();
              }
            }),
      ),
      floatingActionButton:ElevatedButton(child: Icon(Icons.add),onPressed: (){
        Get.to(new SuivieNutritionnelDetailPage(widget.id));
      },),
    );
  }
}
