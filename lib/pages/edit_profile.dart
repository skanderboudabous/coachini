import 'dart:io';

import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/widgets/online_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> genderOptions = ['Male', 'Female'];
  File? _image;
  final picker = ImagePicker();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold)),
        centerTitle: true,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: FirebaseController.to.getFirestoreUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final adherant = snapshot.data as Adherant;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () => {getImage()},
                            child: _image == null
                                ? adherant.pictureUrl != null
                                    ? OnlineImage(
                                        adherant.pictureUrl!,
                                        width: 100,
                                        height: 100,
                                        size: 25,
                                      )
                                    : CircleAvatar(
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
                                  )),
                      ),
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            FormBuilderTextField(
                              name: 'firstName',
                              decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(color: Colors.white)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              initialValue: adherant.firstName==null ? '':adherant.firstName.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                            ),
                            FormBuilderTextField(
                              name: 'lastName',
                              decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(color: Colors.white)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              initialValue: adherant.lastName==null ? '':adherant.lastName.toString(),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                            ),
                            FormBuilderTextField(
                              name: 'phone',
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(color: Colors.white)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                                FormBuilderValidators.maxLength(context, 8),
                                FormBuilderValidators.minLength(context, 8),
                              ]),
                              initialValue: adherant.phone==null ? '': adherant.phone.toString(),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                            ),
                            FormBuilderDateTimePicker(
                              name: 'birthday',
                              // onChanged: _onChanged,
                              inputType: InputType.date,
                              decoration: InputDecoration(
                                  labelText: 'Birthday',
                                  labelStyle: TextStyle(color: Colors.white)),
                              initialValue: adherant.birthday,
                              style: TextStyle(color: Colors.white),
                              // initialValue: DateTime.now(),
                              // enabled: true,
                            ),
                            FormBuilderDropdown(
                                name: 'sexe',
                                decoration: InputDecoration(
                                    labelText: 'Gender',
                                    labelStyle: TextStyle(color: Colors.white)),
                                initialValue: adherant.sexe==null ? 'Male': adherant.sexe.toString(),
                                style: TextStyle(color: Colors.white),
                                dropdownColor: Colors.black,
                                allowClear: true,
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(context)]),
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
                    ],
                  ),
                ),
              );
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                _formKey.currentState?.save();
                if (_formKey.currentState?.validate() == true) {
                  print(_formKey.currentState?.value);
                  await FirebaseController.to.updateProfile(
                      data: _formKey.currentState?.value, image: _image);
                  Get.toNamed(AppRoutes.HOME);
                } else {
                  print("validation failed");
                }
              },
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: MaterialButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _formKey.currentState?.reset();
              },
            ),
          ),
        ],
      ),
    );
  }
}
