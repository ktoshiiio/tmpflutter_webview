import 'package:tmpflutter_webview_platform_interface/tmpflutter_webview_platform_interface.dart';

///{@macro tmpflutter_webview_platform_interface.PlatformWebMessageListener}
class WebMessageListener {
  ///{@macro tmpflutter_webview_platform_interface.PlatformWebMessageListener}
  WebMessageListener(
      {required String jsObjectName,
      Set<String>? allowedOriginRules,
      OnPostMessageCallback? onPostMessage})
      : this.fromPlatformCreationParams(
            params: PlatformWebMessageListenerCreationParams(
                jsObjectName: jsObjectName,
                allowedOriginRules: allowedOriginRules,
                onPostMessage: onPostMessage));

  /// Constructs a [WebMessageListener].
  ///
  /// See [WebMessageListener.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebMessageListener.fromPlatformCreationParams({
    required PlatformWebMessageListenerCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebMessageListener(params));

  /// Constructs a [WebMessageListener] from a specific platform implementation.
  WebMessageListener.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebMessageListener] for the current platform.
  final PlatformWebMessageListener platform;

  ///{@macro tmpflutter_webview_platform_interface.PlatformWebMessageListener.jsObjectName}
  String get jsObjectName => platform.jsObjectName;

  ///{@macro tmpflutter_webview_platform_interface.PlatformWebMessageListener.allowedOriginRules}
  Set<String>? get allowedOriginRules => platform.allowedOriginRules;

  ///{@macro tmpflutter_webview_platform_interface.PlatformWebMessageListener.onPostMessage}
  OnPostMessageCallback? get onPostMessage => platform.onPostMessage;

  ///{@macro tmpflutter_webview_platform_interface.PlatformWebMessageListener.dispose}
  void dispose() => platform.dispose();

  Map<String, dynamic> toMap() => platform.toMap();

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}

///{@macro tmpflutter_webview_platform_interface.PlatformJavaScriptReplyProxy}
class JavaScriptReplyProxy {
  ///{@macro tmpflutter_webview_platform_interface.PlatformJavaScriptReplyProxy}
  JavaScriptReplyProxy({required PlatformWebMessageListener webMessageListener})
      : this.fromPlatformCreationParams(
            params: PlatformJavaScriptReplyProxyCreationParams(
                webMessageListener: webMessageListener));

  /// Constructs a [JavaScriptReplyProxy].
  ///
  /// See [JavaScriptReplyProxy.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  JavaScriptReplyProxy.fromPlatformCreationParams({
    required PlatformJavaScriptReplyProxyCreationParams params,
  }) : this.fromPlatform(platform: PlatformJavaScriptReplyProxy(params));

  /// Constructs a [JavaScriptReplyProxy] from a specific platform implementation.
  JavaScriptReplyProxy.fromPlatform({required this.platform});

  /// Implementation of [PlatformJavaScriptReplyProxy] for the current platform.
  final PlatformJavaScriptReplyProxy platform;

  ///{@macro tmpflutter_webview_platform_interface.PlatformJavaScriptReplyProxy.postMessage}
  Future<void> postMessage(WebMessage message) => platform.postMessage(message);

  @override
  String toString() {
    return 'JavaScriptReplyProxy{}';
  }
}
