import 'package:coachini/pages/add-exercice.dart';
import 'package:coachini/pages/home.dart';
import 'package:coachini/pages/profile.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
const users = const {
  'user@gmail.com': 'useruser',
  'hunter@gmail.com': 'hunter',
};
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? page="login";


  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    setState(() {
      page="login";
    });
    await Get.find<FirebaseController>().login(email: data.name, password: data.password,context: context);
    return "";
  }

  Future<String?> _signUpUser(LoginData data) async {
    await Get.find<FirebaseController>().register(email: data.name, password: data.password,context:context);
    setState(() {
      page="signup";
    });
    return null;
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child : FlutterLogin(
                  theme: LoginTheme(pageColorLight: Colors.transparent),
                  logo: 'assets/images/logo.png',
                  onLogin: _authUser,
                  onSignup: _signUpUser,
                  onSubmitAnimationCompleted: () {
//                     if(page=="login"){
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => HomePage(),
//                       ));
//                     } else if(page=="signup"){
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => ProfilePage(),
//                       ));
//                     }
                  },
                  onRecoverPassword: _recoverPassword,
                )
            )
        )
    );
  }
}
