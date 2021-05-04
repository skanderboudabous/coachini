import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/helpers/helpers.dart';
import 'package:coachini/widgets/label_button.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseController authController = FirebaseController.to;
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool hide=true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        useDefaultLoading: true,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
                colorFilter:  ColorFilter.mode(
                  Colors.grey,
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadiusDirectional.circular(28)),
                    child: FormBuilder(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/logo.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                FormBuilderTextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      labelText: 'Email'),
                                  validator: Validator().email,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) => null,
                                  onSaved: (value) =>
                                      emailController.text = value!,
                                  name: 'email',
                                ),

                                FormBuilderTextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: this.hide ? Colors.blue : Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() => this.hide = !this.hide);
                                        },
                                      ),
                                      labelText: 'Password'),
                                  validator: Validator().password,
                                  obscureText: hide,
                                  onChanged: (value) => null,
                                  onSaved: (value) =>
                                      passwordController.text = value!,
                                  maxLines: 1,
                                  name: 'password',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                PrimaryButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      authController.login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context);
                                    }
                                  },
                                  buttonLabel: 'Sign In',
                                  fontSize: 14,
                                  bgColor: Colors.lightBlue,
                                  width: 150,
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                PrimaryButton(
                                  onPressed: () =>
                                      Get.toNamed(AppRoutes.SIGNUP),
                                  buttonLabel: 'Signup',
                                  fontSize: 14,
                                  bgColor: Colors.lightBlue,
                                  width: 150,
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),

//                              LabelButton(
//                                labelText: 'Password Reset',
//                                onPressed: () => print("Password Reset"),
//                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
