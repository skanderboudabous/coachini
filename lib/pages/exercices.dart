import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/exercices_detail.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/widgets/exercice_card.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercicesPage extends StatefulWidget {
  final String? userId;
  ExercicesPage(this.userId);
  @override
  _ExercicesPageState createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {
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
          title: Text("Execrcices",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          isAdmin == true
              ? Get.toNamed(AppRoutes.USER_PROFILE + "?id=" + widget.userId!)
              : Get.toNamed(AppRoutes.HOME);
        },)
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            image: AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
            future: FirebaseController.to.getUserExercices(id: widget.userId),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                final List<DocumentSnapshot>? documents = snapshot.data?.docs;

                return ListView.builder(
                    itemCount: documents?.length,
                    itemBuilder: (context, index) {
                      final Exercice exercice = Exercice.fromMap(documents?[index].data());
                      return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ExercicesCard(exercice, widget.userId));
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
          Get.to(new ExerciceDetailPage(widget.userId));
        },
      )
          : SizedBox(),
    );
  }
}
