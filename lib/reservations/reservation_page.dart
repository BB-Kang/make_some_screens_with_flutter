import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 예약현황'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://www.naver.com',
      ),
    );
  }
}
