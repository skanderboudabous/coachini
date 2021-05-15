import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/user_unsubscribed_card.dart';
import 'package:flutter/material.dart';
class UsersUnSubscribed extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseController.to.getUsersUnSubscribed(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot>? documents = snapshot.data?.docs;
            return ListView.builder(
                itemCount: documents?.length,
                itemBuilder: (context, index) {
                  final Adherant adherant = Adherant.fromMap(documents?[index]);
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: UserUnSubscribedCard(adherant),
                  );
                });
          } else {
            return Loader();
          }
        });
  }
}