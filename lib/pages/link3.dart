import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Link3 extends StatefulWidget {
  @override
  Link3State createState() => Link3State();
}

class Link3State extends State<Link3> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSf9550hdvDOjMvQukzqVQuFBNongSC5JvDOP7o6MyFMOW1_-g/viewform?fbclid=IwAR2Syg1oYcKzXcyetGPZDBSRFEQaiVgpi9mcIauH4T7MyHEzqnZg_vCkh0o',
    );
  }
}
