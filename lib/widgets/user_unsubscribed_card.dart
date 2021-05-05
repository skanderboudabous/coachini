import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/models/adherant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'online_image.dart';
class UserUnSubscribedCard extends StatelessWidget {
  final Adherant adherant;
  UserUnSubscribedCard(this.adherant);
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
              OnlineImage( this.adherant.pictureUrl!),
              Text(adherant.firstName!+" "+adherant.lastName!),
            ],
          ),
        ),
      ),
    );
  }
}
