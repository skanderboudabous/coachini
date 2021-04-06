import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/add-exercice.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:coachini/widgets/exercice-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercicesPage extends StatefulWidget {
  @override
  _ExercicesPageState createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Get.to(AddExercicePage());
          }),
          FutureBuilder(
              future: Get.find<FirebaseService>().getExercices(),
              builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.size,
                    itemBuilder: (context, index)  {
                      return ExerciceCard(
                          exercice:
                          Exercice.fromMap(snapshot.data?.docs[index].data()));
                    });
          }),
        ],
      ),
    );
  }
}
