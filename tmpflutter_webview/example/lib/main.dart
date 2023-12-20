import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tmpflutter_webview/tmpflutter_webview.dart';
import 'package:tmpflutter_webview_example/webiew_example.screen.dart';

InAppLocalhostServer localhostServer =
    InAppLocalhostServer(documentRoot: 'assets');

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  if (!kIsWeb) {
    await localhostServer.start();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // 新しいホーム画面を設定
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMAAD'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open WebView'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WebViewExampleScreen()),
            );
          },
        ),
      ),
    );
  }
}
