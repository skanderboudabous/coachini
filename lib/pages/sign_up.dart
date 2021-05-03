import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/helpers/helpers.dart';
import 'package:coachini/pages/sigin.dart';
import 'package:coachini/widgets/label_button.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final FirebaseController authController = FirebaseController.to;
  final  _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FormBuilderTextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email), labelText: 'Email'),
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        emailController.text = value!,
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
                    onSaved: (value) =>
                        passwordController.text = value!,
                    maxLines: 1,
                    name: 'password',
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PrimaryButton(
                      labelText: 'Signup',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SystemChannels.textInput.invokeMethod(
                              'TextInput.hide'); //to hide the keyboard - if any
                          authController.register(email: emailController.text,password: passwordController.text,context:context);
                        }
                      }),
                  SizedBox(
                    height: 24,
                  ),
                  LabelButton(
                    labelText: 'Sign In',
                    onPressed: () => Get.toNamed(AppRoutes.SIGNIN),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
