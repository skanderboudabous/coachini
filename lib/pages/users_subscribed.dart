import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/user_subscribed_card.dart';
import 'package:flutter/material.dart';

class UsersSubscribed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseController.to.getUsersSubscribed(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot>? documents = snapshot.data?.docs;

            return ListView.builder(
                itemCount: documents?.length,
                itemBuilder: (context, index) {
                  final Adherant adherant = Adherant.fromMap(documents?[index].data());
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: UserSubscribedCard(adherant),
                  );
                });
          } else {
            return Loader();
          }
        });
  }
}
