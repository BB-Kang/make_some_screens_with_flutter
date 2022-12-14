import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfluencerPage extends StatelessWidget {
  const InfluencerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인플루언서'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://lolchess.gg',
      ),
    );
  }
}
