import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/techniques-preparation-mentale.dart';
import 'package:coachini/pages/techniques-preparation-mentale-detail.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/techniques-preparation-mentale-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TechniquesPreparationMentalePage extends StatefulWidget {
  final String? userId;

  TechniquesPreparationMentalePage(this.userId);

  @override
  _TechniquesPreparationMentalePageState createState() => _TechniquesPreparationMentalePageState();
}

class _TechniquesPreparationMentalePageState extends State<TechniquesPreparationMentalePage> {
  bool? isAdmin;
  List<DocumentSnapshot>? documents= [];

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
        title: Text("Techniques de préparation mentale",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            isAdmin == true
                ? Get.toNamed(AppRoutes.USER_PROFILE + "?id=" + widget.userId!)
                : Get.toNamed(AppRoutes.HOME);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            image: AssetImage("assets/images/bg8.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
            future: FirebaseController.to.getUserTechniquesPreparationMentale(id: widget.userId),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                documents = snapshot.data?.docs;
                return ListView.builder(
                    itemCount: documents?.length,
                    itemBuilder: (context, index) {
                      final TechniquesPreparationMentale techniquesPreparationMentale = TechniquesPreparationMentale.fromMap(documents?[index].data());
                      return Padding(
                          padding: const EdgeInsets.all(8),
                          child: TechniquesPreparationMentaleCard(techniquesPreparationMentale, widget.userId,onPressed:(){
                            (isAdmin == true) ?Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Supprimer ",
                              desc: "vous êtes sur ??",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    await FirebaseController.to.deleteUserTechniquesPreparationMentale(
                                        widget.userId,techniquesPreparationMentale.id);
                                    setState(() {
                                      documents?.removeAt(index);
                                    });
                                  },
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "No",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(116, 116, 191, 1.0),
                                    Color.fromRGBO(52, 138, 199, 1.0)
                                  ]),
                                )
                              ],
                            ).show() : print('not Admin');
                          }));
                    });
              } else {
                return Loader();
              }
            }),
      ),
      floatingActionButton: isAdmin == true
          ? ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(new TechniquesPreparationMentaleDetailPage(widget.userId));
        },
      )
          : SizedBox(),
    );
  }
}
