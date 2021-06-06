import 'package:coachini/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold)),
        centerTitle: true,),
      body: WillPopScope(
        onWillPop: (){
          Get.toNamed(AppRoutes.HOME);
          return Future.value(false);
        },
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
