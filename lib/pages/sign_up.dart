import 'dart:io';

import 'package:coachini/models/adherant.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/helpers/helpers.dart';
import 'package:coachini/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseController authController = FirebaseController.to;

  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  int currentStep = 0;
  bool? complete = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  goTo(int step) {
    setState(() {
      this.currentStep = step;
    });
  }

  next() {
    if (currentStep + 1 != 3) {
      goTo(currentStep + 1);
    } else {
      setState(() {
        register();

      });
    }
  }

  register()  {
    if (_formKey.currentState!.validate() && _formKey2.currentState!.validate() && _image!=null) {
      complete=true;
      _formKey2.currentState?.saveAndValidate();
      SystemChannels.textInput
          .invokeMethod('TextInput.hide');
      Adherant adherant=Adherant.fromMap(_formKey2.currentState?.value);
      adherant.email= emailController.text;
      print(adherant.toMap());
      FirebaseController.to.register(adherant: adherant, password: passwordController.text, image:_image, context: context);
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    } else {
      Get.toNamed(AppRoutes.SIGNIN);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoaderOverlay(
        useDefaultLoading: true,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                    controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          PrimaryButton(
                            onPressed: onStepContinue,
                            buttonLabel:
                                currentStep >= 2 ? 'Signup' : 'Continuer',
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                          ),
                          PrimaryButton(
                            onPressed: onStepCancel,
                            buttonLabel: 'Annuler',
                            fontSize: 14,
                            bgColor: Colors.lightBlue,
                          ),
                        ],
                      );
                    },
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepCancel: cancel,
                    onStepTapped: (step) => goTo(step),
                    steps: [
                      Step(
                          title: Text(
                            'Login Details',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
                          ),
                          isActive: currentStep == 0,
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/logo.png"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              FormBuilder(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Image.asset(
                                                'assets/images/logo.png',
                                                height: 100,
                                                width: 150),
                                            FormBuilderTextField(
                                              controller: emailController,
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.email,
                                                      color: Colors.white),
                                                  labelText: 'Email',
                                                  labelStyle: TextStyle(
                                                      color: Colors.white)),
                                              validator: Validator().email,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: (value) => null,
                                              onSaved: (value) =>
                                                  emailController.text = value!,
                                              name: 'email',
                                            ),
                                            FormBuilderTextField(
                                              controller: passwordController,
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.white,
                                                  ),
                                                  labelText: 'Password',
                                                  labelStyle: TextStyle(
                                                      color: Colors.white)),
                                              validator: Validator().password,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              obscureText: true,
                                              onChanged: (value) => null,
                                              onSaved: (value) =>
                                                  passwordController.text =
                                                      value!,
                                              maxLines: 1,
                                              name: 'password',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Step(
                          isActive: currentStep == 1,
                          title: Text(
                            'Pesonal Details',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
                          ),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FormBuilder(
                                key: _formKey2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child:
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Column(
                                            children: <Widget>[
                                              FormBuilderTextField(
                                                name: 'firstName',
                                                decoration: InputDecoration(
                                                    labelText: 'First Name',
                                                    labelStyle:
                                                        TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.required(context),
                                                ]),
                                                initialValue: '',
                                                style: TextStyle(color: Colors.white),
                                                keyboardType: TextInputType.name,
                                              ),
                                              FormBuilderTextField(
                                                name: 'lastName',
                                                decoration: InputDecoration(
                                                    labelText: 'Last Name',
                                                    labelStyle:
                                                        TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.required(context),
                                                ]),
                                                initialValue: '',
                                                style: TextStyle(color: Colors.white),
                                                keyboardType: TextInputType.name,
                                              ),
                                              FormBuilderTextField(
                                                name: 'phone',
                                                decoration: InputDecoration(
                                                    labelText: 'Phone Number',
                                                    labelStyle:
                                                        TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.required(context),
                                                  FormBuilderValidators.numeric(context),
                                                  FormBuilderValidators.maxLength(
                                                      context, 8),
                                                  FormBuilderValidators.minLength(
                                                      context, 8),
                                                ]),
                                                initialValue: '',
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              FormBuilderDateTimePicker(
                                                name: 'birthday',
                                                // onChanged: _onChanged,
                                                inputType: InputType.date,
                                                decoration: InputDecoration(
                                                    labelText: 'Birthday',
                                                    labelStyle:
                                                        TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                                initialValue: new DateTime(1990, 1, 1),
                                                style: TextStyle(color: Colors.white),
                                                // initialValue: DateTime.now(),
                                                // enabled: true,
                                              ),
                                              FormBuilderDropdown(
                                                  name: 'sexe',
                                                  decoration: InputDecoration(
                                                      labelText: 'Gender',
                                                      labelStyle:
                                                          TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                                  initialValue: 'Male',
                                                  style: TextStyle(color: Colors.white),
                                                  dropdownColor: Colors.black,
                                                  allowClear: true,
                                                  validator:
                                                      FormBuilderValidators.compose([
                                                    FormBuilderValidators.required(
                                                        context)
                                                  ]),
                                                  items: [
                                                    DropdownMenuItem(
                                                      child: Text('Male'),
                                                      value: 'Male',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text(
                                                        'Female',
                                                      ),
                                                      value: 'Female',
                                                    )
                                                  ]),
                                            ],
                                          ),
                                        ),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Step(
                          isActive: currentStep == 2,
                          title: Text(
                            'Profile Picture',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
                          ),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              GestureDetector(
                                  onTap: () => {getImage()},
                                  child: _image == null
                                      ? CircleAvatar(
                                          minRadius: 50,
                                          maxRadius: 50,
                                          child: Icon(Icons.add))
                                      : CircleAvatar(
                                          maxRadius: 50,
                                          minRadius: 50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(_image!)),
                                            ),
                                          ),
                                        ))
                            ],
                          ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
