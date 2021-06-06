import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Link1 extends StatefulWidget {
  @override
  Link1State createState() => Link1State();
}

class Link1State extends State<Link1> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSfb1Vo4STrSD1JhFSM922hw2D7fGN-NMFzSgM7Bq995QfZ7GQ/viewform?fbclid=IwAR3Tfy3P_LLO3BRjO_nPsLlqOzpWVJxn4vHWo24KgZ9gAHYBlF8wtdLnKzI',
    );
  }
}
