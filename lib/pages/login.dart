import 'package:coachini/services/firebase.-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
               var firebaseService= Get.find<FirebaseService>();
               print(firebaseService.appUser);

              },
              child: Text("AppUser"),
            ),
            MaterialButton(
              onPressed: () {
                Get.find<FirebaseService>().logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
