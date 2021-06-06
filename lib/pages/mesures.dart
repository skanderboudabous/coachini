import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/mesures_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mesures_detail.dart';

class MesuresPage extends StatefulWidget {
  final String? userId;

  MesuresPage(this.userId);

  @override
  _MesuresPageState createState() => _MesuresPageState();
}

class _MesuresPageState extends State<MesuresPage> {
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
        title: Text("Mesures",
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
      body: FutureBuilder(
          future: FirebaseController.to.getUserMesures(id: widget.userId),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              final List<DocumentSnapshot>? documents = snapshot.data?.docs;

              return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    final Mesure mesure = Mesure.fromMap(documents?[index].data());
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: MesuresCard(mesure, widget.userId));
                  });
            } else {
              return Loader();
            }
          }),
      floatingActionButton: isAdmin == true
          ? ElevatedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Get.to(new MesuresDetailPage(widget.userId));
              },
            )
          : SizedBox(),
    );
  }
}
