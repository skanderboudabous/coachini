import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/suivi-entrainement.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivi_entrainement_detail.dart';
import 'package:coachini/pages/suivie_nutritionnel_detail.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/suivi_nutritionnel_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SuiviEntrainementPage extends StatefulWidget {
  final String? userId;
  SuiviEntrainementPage(this.userId);
  @override
  _SuiviEntrainementPageState createState() => _SuiviEntrainementPageState();
}

class _SuiviEntrainementPageState extends State<SuiviEntrainementPage> {


  bool? isAdmin;
  @override
  void initState() {
    isAdmin = Get.find<FirebaseController>().admin.value;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          isAdmin==true ?
          Get.toNamed(AppRoutes.USER_PROFILE+"?id="+widget.userId!) :
          Get.toNamed(AppRoutes.HOME);
        },),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.toNamed(AppRoutes.USER_PROFILE+"?id="+widget.userId!);
          return Future.value(false);
        },
        child: FutureBuilder(
            future: FirebaseController.to.getUserSuiviEntrainements(id:widget.userId),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot>? documents = snapshot.data?.docs;

                return ListView.builder(
                    itemCount: documents?.length,
                    itemBuilder: (context, index) {
                      final SuiviEntrainement suiviEntrainement = SuiviEntrainement.fromMap(documents?[index].data());
                      return Padding(
                          padding: const EdgeInsets.all(8),
                          child: SuiviEntrainementCard(suiviEntrainement,widget.userId)
                      );
                    });
              } else {
                return Loader();
              }
            }),
      ),
      floatingActionButton: isAdmin==true ? ElevatedButton(child: Icon(Icons.add),onPressed: (){
        Get.to(new SuiviEntrainementDetailPage(widget.userId));
      },) : SizedBox(),
    );
  }
}
