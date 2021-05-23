import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/composition-corporelle.dart';
import 'package:coachini/widgets/composition_corporelle_card.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'composition_corporelle_detail.dart';

class CompositionCorporellePage extends StatefulWidget {
  final String? userId;

  CompositionCorporellePage(this.userId);

  @override
  _CompositionCorporellePageState createState() => _CompositionCorporellePageState();
}

class _CompositionCorporellePageState extends State<CompositionCorporellePage> {
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
          future: FirebaseController.to.getUserCompositionCorporelle(id: widget.userId),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              final List<DocumentSnapshot>? documents = snapshot.data?.docs;
              return ListView.builder(
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    final CompositionCorporelle compositionCorporelle = CompositionCorporelle.fromMap(documents?[index].data());
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: CompositionCorporelleCard(compositionCorporelle, widget.userId));
                  });
            } else {
              return Loader();
            }
          }),
      floatingActionButton: isAdmin == true
          ? ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(new CompositionCorporelleDetailPage(widget.userId));
        },
      )
          : SizedBox(),
    );
  }
}
