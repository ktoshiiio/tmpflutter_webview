package com.pichillilorenzo.flutterwebviewexample;

import android.os.Bundle;
import com.pichillilorenzo.tmpflutter_webview_android.InAppWebViewFlutterPlugin;

@SuppressWarnings("deprecation")
public class EmbedderV1Activity extends io.flutter.app.FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    InAppWebViewFlutterPlugin.registerWith(
            registrarFor("com.pichillilorenzo.tmpflutter_webview.InAppWebViewFlutterPlugin"));
  }
}