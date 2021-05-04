import 'package:flutter/material.dart';
class PrimaryButton extends StatelessWidget {
  PrimaryButton({required this.labelText, required this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(),
      child: Text(
        labelText.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
