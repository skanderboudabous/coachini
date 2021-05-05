import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/online_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              OnlineImage( this.adherant.pictureUrl!),
              Text(adherant.firstName!+" "+adherant.lastName!),
            ],
          ),
        ),
      ),
    );
  }
}
