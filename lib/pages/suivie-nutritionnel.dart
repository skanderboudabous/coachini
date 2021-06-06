import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/pages/suivie_nutritionnel_detail.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/suivi_entrainement_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SuivieNutritionnelPage extends StatefulWidget {
  final String? userId;
  SuivieNutritionnelPage(this.userId);
  @override
  _SuivieNutritionnelPageState createState() => _SuivieNutritionnelPageState();
}

class _SuivieNutritionnelPageState extends State<SuivieNutritionnelPage> {


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
        title: Text("Suivis Nutritionnel",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              image: AssetImage("assets/images/bg4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
              future: FirebaseController.to.getUserSuivieNutritionnels(id:widget.userId),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot>? documents = snapshot.data?.docs;

                  return ListView.builder(
                      itemCount: documents?.length,
                      itemBuilder: (context, index) {
                        final SuivieNutritionnel suivieNutritionnel = SuivieNutritionnel.fromMap(documents?[index].data());
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: SuiviNutritionnelCard(suivieNutritionnel,widget.userId)
                        );
                      });
                } else {
                  return Loader();
                }
              }),
        ),
      ),
      floatingActionButton: isAdmin==true ? ElevatedButton(child: Icon(Icons.add),onPressed: (){
        Get.to(new SuivieNutritionnelDetailPage(widget.userId));
      },) : SizedBox(),
    );
  }
}
