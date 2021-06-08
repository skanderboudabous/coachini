import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

void showShortToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void sendEmail(String email) async{
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
  );
  await launch(_emailLaunchUri.toString());
}

void phoneCall(String phone) async{
  final Uri _phoneLaunchUri = Uri(
    scheme: 'tel',
    path: phone
  );
  await launch(_phoneLaunchUri.toString());
}