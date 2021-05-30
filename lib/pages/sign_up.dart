import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/helpers/helpers.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpPage extends StatelessWidget {
  final FirebaseController authController = FirebaseController.to;
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoaderOverlay(
        useDefaultLoading: true,
        child: Stack(children: [
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
                      fit: BoxFit.cover),
                ),
              ),
              FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.asset('assets/images/logo.png',
                                height: 100, width: 150),
                            FormBuilderTextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'Email'),
                              validator: Validator().email,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => null,
                              onSaved: (value) => emailController.text = value!,
                              name: 'email',
                            ),
                            FormBuilderTextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'Password'),
                              validator: Validator().password,
                              obscureText: true,
                              onChanged: (value) => null,
                              onSaved: (value) =>
                                  passwordController.text = value!,
                              maxLines: 1,
                              name: 'password',
                            ),
                            FormBuilderTextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'Confirm Password'),
                              validator: Validator().password,
                              obscureText: true,
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
                                if (_formKey.currentState!.validate())  {
                                  SystemChannels.textInput.invokeMethod(
                                      'TextInput.hide'); //to hide the keyboard - if any
                                var adherant= await  authController.register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context);
                                print(adherant);
                                }
                              },
                              buttonLabel: 'Signup',
                              fontSize: 14,
                              bgColor: Colors.lightBlue,
                              width: 340,
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            PrimaryButton(
                              onPressed: () => Get.toNamed(AppRoutes.SIGNIN),
                              buttonLabel: 'Sign In',
                              fontSize: 14,
                              bgColor: Colors.lightBlue,
                              width: 340,
                              height: 50,
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
        ]),
      ),
    );
  }
}
