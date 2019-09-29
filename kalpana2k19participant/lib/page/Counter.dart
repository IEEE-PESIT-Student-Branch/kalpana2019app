import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        width: double.infinity,
        height: double.infinity,
        // child: WebviewScaffold(
        //   withJavascript: true,
        //   url: 'http://192.168.1.2:8080/',
        //   displayZoomControls: true,
        // ),
      ),
    );
  }
}