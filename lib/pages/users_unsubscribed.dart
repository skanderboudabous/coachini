import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/loader.dart';
import 'package:coachini/widgets/user_unsubscribed_card.dart';
import 'package:flutter/material.dart';
class UsersUnSubscribed extends StatelessWidget {
  final String filter;
  UsersUnSubscribed(this.filter);
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseController.to.getUsersUnSubscribed(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot>? documents = snapshot.data?.docs;
            List<Adherant>? adherants = documents?.map((e) =>
                Adherant.fromMap(e.data())).toList();
            if(filter!="")
            {
              adherants=adherants?.where((adherant) {
                String fullName= (adherant.firstName!.toLowerCase()) +
                    " " +
                    (adherant.lastName!.toLowerCase());
                return fullName.contains(filter.toLowerCase());
              }).toList();
            }
            return ListView.builder(
                itemCount: adherants?.length,
                itemBuilder: (context, index) {
                  final Adherant? adherant =adherants?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: UserUnSubscribedCard(adherant!),
                  );
                });
          } else {
            return Loader();
          }
        });
  }
}
