import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> genderOptions=['Male','Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'First Name',
                    decoration: InputDecoration(
                      labelText:
                      'First Name',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'Last Name',
                    decoration: InputDecoration(
                      labelText:
                      'Last Name',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'Phone',
                    decoration: InputDecoration(
                      labelText:
                      'Phone Number',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 8),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderDateTimePicker(
                    name: 'date',
                    // onChanged: _onChanged,
                    inputType: InputType.date,
                    decoration: InputDecoration(
                      labelText: 'Birthday',
                    ),
                    // initialValue: DateTime.now(),
                    // enabled: true,
                  ),


                  FormBuilderDropdown(
                    name: 'gender',
                    decoration: InputDecoration(
                      labelText: 'Gender',
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text('Select Gender'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text('$gender'),
                    ))
                        .toList(),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState?.validate()==true) {
                        print(_formKey.currentState?.value);
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
            )
          ],
        ),
      ),
    );
  }
}
