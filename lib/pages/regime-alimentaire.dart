import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/regime-alimentaire.dart';
import 'package:coachini/pages/regime-alimentaire-detail.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/regime-alimentaire-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegimeAlimentairePage extends StatefulWidget {
  final String? userId;

  RegimeAlimentairePage(this.userId);

  @override
  _RegimeAlimentairePageState createState() => _RegimeAlimentairePageState();
}

class _RegimeAlimentairePageState extends State<RegimeAlimentairePage> {
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
          future: FirebaseController.to.getUserRegimeAlimentaire(id: widget.userId),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              final List<DocumentSnapshot>? documents = snapshot.data?.docs;
              return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    final RegimeAlimentaire regimeAlimentaire = RegimeAlimentaire.fromMap(documents?[index].data());
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: RegimeAlimentaireCard(regimeAlimentaire, widget.userId));
                  });
            } else {
              return Loader();
            }
          }),
      floatingActionButton: isAdmin == true
          ? ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(new RegimeAlimentaireDetailPage(widget.userId));
        },
      )
          : SizedBox(),
    );
  }
}
