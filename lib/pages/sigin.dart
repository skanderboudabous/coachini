import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/helpers/helpers.dart';
import 'package:coachini/pages/sign_up.dart';
import 'package:coachini/widgets/label_button.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
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
  final  _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        useDefaultLoading: true,
        child: Stack(
          children:[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 48.0),
                              FormBuilderTextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email), labelText: 'Email'),
                                validator: Validator().email,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) => null,
                                onSaved: (value) => emailController.text = value!,
                                name: 'email',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              FormBuilderTextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                                validator: Validator().password,
                                obscureText: true,
                                onChanged: (value) => null,
                                onSaved: (value) => passwordController.text = value!,
                                maxLines: 1,
                                name: 'password',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 60),
                                child: PrimaryButton(
                                    labelText: 'Sign In',
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        authController.login(email: emailController.text,password: passwordController.text,context:context);
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              LabelButton(
                                labelText: 'Signup',
                                onPressed: () => Get.toNamed(AppRoutes.SIGNUP),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

