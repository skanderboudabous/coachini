import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Link2 extends StatefulWidget {
  @override
  Link2State createState() => Link2State();
}

class Link2State extends State<Link2> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLScci6ZsJQd2G7O1ZNwHJeVLyHVU5TzLUyQDxtn7_O858F5sXw/viewform?fbclid=IwAR0ZHKZUD8NNWoGTJ9Fg7Wm6V5BWsZMkzly17myq-ECZokpl7eyjyecpLOw',
    );
  }
}
