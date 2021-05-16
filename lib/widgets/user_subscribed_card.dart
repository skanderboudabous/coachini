import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/online_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class UserSubscribedCard extends StatelessWidget {
  final Adherant adherant;
  UserSubscribedCard(this.adherant);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.USER_PROFILE+"?id="+this.adherant.id!,);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnlineImage( this.adherant.pictureUrl),
              Text(adherant.firstName!+" "+adherant.lastName!),
              IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "Désabonner "+adherant.firstName!+" "+adherant.lastName!,
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
                                .setUserUnSubscribed(userId: adherant.id);
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
        ),
      ),
    );
  }
}
