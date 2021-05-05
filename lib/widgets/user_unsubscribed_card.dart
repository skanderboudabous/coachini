import 'package:coachini/models/adherant.dart';
import 'package:flutter/material.dart';
class UserUnSubscribedCard extends StatelessWidget {
  final Adherant adherant;
  UserUnSubscribedCard(this.adherant);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(adherant.firstName!+" "+adherant.lastName!),
    );
  }
}
