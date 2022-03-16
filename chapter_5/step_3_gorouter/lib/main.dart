import 'package:flutter/material.dart';
import 'register_web_webview_stub.dart'
    if (dart.library.html) 'register_web_webview.dart';
import 'src/app.dart';

void main() async {
  registerWebViewWebImplementation();

  runApp(const HackerNewsApp());
}
