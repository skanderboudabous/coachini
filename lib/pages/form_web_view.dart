
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FormWebView extends StatefulWidget {
  String? url;
  FormWebView(this.url);
  @override
  FormWebViewState createState() => FormWebViewState();
}

class FormWebViewState extends State<FormWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (GetPlatform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
    );
  }
}
