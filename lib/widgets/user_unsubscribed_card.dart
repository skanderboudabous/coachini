import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'online_image.dart';

class UserUnSubscribedCard extends StatelessWidget {
  final Adherant adherant;
  UserUnSubscribedCard(this.adherant);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.USER_PROFILE + "?id=" + this.adherant.id!,
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  OnlineImage(this.adherant.pictureUrl),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text(adherant.firstName! + " " + adherant.lastName!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),

              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.done),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "abooner "+adherant.firstName!+" "+adherant.lastName!,
                          desc: "vous êtes sur ??",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Yes",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                FirebaseController.to
                                    .setUserSubscribed(userId: adherant.id);
                              },
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "GRADIENT",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      }),
                  IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Supprimer "+adherant.firstName!+" "+adherant.lastName!,
                          desc: "vous êtes sur ??",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Yes",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                FirebaseController.to
                                    .deleteUser(userId: adherant.id);
                              },
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "GRADIENT",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      })
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
