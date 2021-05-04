import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  /// This is the button label text
  final String? buttonLabel;

  /// on press function
  final VoidCallback? onPressed;

  /// This is the font size of the text
  final double? fontSize;

  /// This is the color of the button's text
  final Color? textColor;

  /// This is the color of the button's text
  final Color? bgColor;

  /// This is width of button
  final double? width;

  /// This is height of button
  final double? height;

  const PrimaryButton(
      {this.buttonLabel,
        this.bgColor,
        this.width,
        this.height,
        this.fontSize,
        this.textColor,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: this.bgColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),),
        child: Container(
            height: height,
            width: width,
            child: Center(
              child: Text(
                buttonLabel??'',
                style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
            )));
  }
}
