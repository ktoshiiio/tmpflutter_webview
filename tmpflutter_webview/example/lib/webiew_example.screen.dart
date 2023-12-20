import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tmpflutter_webview/tmpflutter_webview.dart';

class WebViewExampleScreen extends StatefulWidget {
  @override
  _WebViewExampleScreenState createState() => _WebViewExampleScreenState();
}

class _WebViewExampleScreenState extends State<WebViewExampleScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  String url = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
      Expanded(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              mediaId: '560363030',
              userParameter: 'user',
              prefixUrl: 'https://dev.fusion-wall.smaad.net/wall/',
              initialSettings: settings,
              onWebViewCreated: (controller) async {
                webViewController = controller;
              },
              onLoadStart: (controller, url) async {
                setState(() {
                  this.url = url.toString();
                });
              },
              onPermissionRequest: (controller, request) async {
                return PermissionResponse(
                    resources: request.resources,
                    action: PermissionResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url!;
                print('uri = $uri');
                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {
                setState(() {
                  this.url = url.toString();
                });
              },
              onReceivedError: (controller, request, error) {},
              onWebViewClosed: (controller) async {
                //TODO Navigator.pop(context);
                print('webview closed');
                Navigator.pop(context);
              },
              onUpdateVisitedHistory: (controller, url, isReload) {
                setState(() {
                  this.url = url.toString();
                });
              },
              onConsoleMessage: (controller, consoleMessage) {
                print(consoleMessage);
              },
            ),
          ],
        ),
      ),
    ])));
  }
}
