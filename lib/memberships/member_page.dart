import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://www.google.com',
      ),
    );
  }
}
