import 'package:coachini/pages/exercices.dart';
import 'package:coachini/services/firebase.-service.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
               var firebaseService= Get.find<FirebaseService>();
               print(firebaseService.user?.fullName());

              },
              child: Text("AppUser"),
            ),
            MaterialButton(
              onPressed: () {
              },
              child: Text("test"),
            ),
            MaterialButton(
              onPressed: () {
                Get.find<FirebaseService>().logout();
              },
              child: Text("Logout"),
            ),
            MaterialButton(onPressed: ()=>{
              Get.to(ExercicesPage())
            },
            child: Text("To Excercice"),
            ),
          ],
        ),
      ),
    );
  }
}
