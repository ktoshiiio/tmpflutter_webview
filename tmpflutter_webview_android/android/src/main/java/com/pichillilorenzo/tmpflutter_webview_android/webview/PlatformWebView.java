package com.pichillilorenzo.tmpflutter_webview_android.webview;

import java.util.HashMap;

import io.flutter.plugin.platform.PlatformView;

public interface PlatformWebView extends PlatformView {
  void makeInitialLoad(HashMap<String, Object> params);
}
