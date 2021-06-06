import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/pages/rm_detail.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/rms_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RMsPage extends StatefulWidget {
  final String? userId;
  final RM? rm;
  RMsPage(this.userId,{this.rm});
  @override
  _RMsPageState createState() => _RMsPageState();
}

class _RMsPageState extends State<RMsPage> {
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
        title: Text("RMs",
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
      body:  FutureBuilder(
          future: FirebaseController.to.getUserRms(id: widget.userId),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              final List<DocumentSnapshot>? documents = snapshot.data?.docs;

              return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    final RM rm = RM.fromMap(documents?[index].data());
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: RMsCard(rm, widget.userId));
                  });
            } else {
              return Loader();
            }
          }),
      floatingActionButton: isAdmin == true
          ? ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(new RMDetailPage(widget.userId));
        },
      )
          : SizedBox(),
    );
  }
}
