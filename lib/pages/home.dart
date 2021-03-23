import 'package:coachini/services/firebase.-service.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coachini"),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            var firebaseService=Get.find<FirebaseService>();

            firebaseService.login(email:"mameya.mseddi@gmail.com",password:"1996medmsd").then((value)
            {


            },onError: (e){

              if(e.code=='user-not-found'){
                showShortToast("User not found");
              }
              else if(e.code=='wrong-password'){
                showShortToast("Wrong password");
              }
            });
          },
          child: Text("Press me"),
        ),
      ),
    );
  }
}
