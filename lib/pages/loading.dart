import 'package:coachini/models/adherant.dart';
import 'package:coachini/pages/admin.dart';
import 'package:coachini/pages/home.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print( Get.find<FirebaseService>().user?.isAdmin);
          return Get.find<FirebaseService>().user == null
              ? Scaffold(body: CircularProgressIndicator())
              : Get.find<FirebaseService>().user?.isAdmin == false
                  ? HomePage()
                  : AdminPage();
        } else {
          return Scaffold(body: CircularProgressIndicator());
        }
      },
      stream: Get.find<FirebaseService>().adherant.stream,
    );
  }
}
