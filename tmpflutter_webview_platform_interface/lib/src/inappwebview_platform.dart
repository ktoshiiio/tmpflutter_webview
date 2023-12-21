import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'chrome_safari_browser/platform_chrome_safari_browser.dart';
import 'find_interaction/platform_find_interaction_controller.dart';
import 'in_app_browser/platform_in_app_browser.dart';
import 'in_app_webview/platform_headless_in_app_webview.dart';
import 'in_app_webview/platform_inappwebview_controller.dart';
import 'in_app_webview/platform_inappwebview_widget.dart';
import 'platform_cookie_manager.dart';
import 'platform_http_auth_credentials_database.dart';
import 'platform_in_app_localhost_server.dart';
import 'print_job/platform_print_job_controller.dart';
import 'pull_to_refresh/platform_pull_to_refresh_controller.dart';
import 'web_authentication_session/platform_web_authenticate_session.dart';
import 'web_message/platform_web_message_channel.dart';
import 'web_message/platform_web_message_listener.dart';
import 'web_message/platform_web_message_port.dart';
import 'web_storage/platform_web_storage.dart';
import 'web_storage/platform_web_storage_manager.dart';
import 'platform_process_global_config.dart';
import 'platform_proxy_controller.dart';
import 'platform_service_worker_controller.dart';
import 'platform_tracing_controller.dart';
import 'platform_webview_asset_loader.dart';
import 'platform_webview_feature.dart';
import 'in_app_localhost_server.dart';

/// Interface for a platform implementation of a WebView.
abstract class InAppWebViewPlatform extends PlatformInterface {
  /// Creates a new [InAppWebViewPlatform].
  InAppWebViewPlatform() : super(token: _token);

  static final Object _token = Object();

  static InAppWebViewPlatform? _instance;

  /// The instance of [InAppWebViewPlatform] to use.
  static InAppWebViewPlatform? get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [InAppWebViewPlatform] when they register themselves.
  static set instance(InAppWebViewPlatform? instance) {
    if (instance == null) {
      throw AssertionError(
          'Platform interfaces can only be set to a non-null instance');
    }

    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Creates a new [PlatformCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CookieManager] in `tmpflutter_webview` instead.
  PlatformCookieManager createPlatformCookieManager(
    PlatformCookieManagerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformCookieManager is not implemented on the current platform.');
  }

  /// Creates a new [PlatformInAppWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [InAppWebViewController] in `tmpflutter_webview` instead.
  PlatformInAppWebViewController createPlatformInAppWebViewController(
    PlatformInAppWebViewControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformInAppWebViewController is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformInAppWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [InAppWebViewController] in `tmpflutter_webview` instead.
  PlatformInAppWebViewController createPlatformInAppWebViewControllerStatic() {
    throw UnimplementedError(
        'createPlatformInAppWebViewControllerStatic is not implemented on the current platform.');
  }

  /// Creates a new [PlatformInAppWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [InAppWebView] in `tmpflutter_webview` instead.
  PlatformInAppWebViewWidget createPlatformInAppWebViewWidget(
    PlatformInAppWebViewWidgetCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformInAppWebViewWidget is not implemented on the current platform.');
  }

  /// Creates a new [PlatformFindInteractionController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [FindInteractionController] in `tmpflutter_webview` instead.
  PlatformFindInteractionController createPlatformFindInteractionController(
    PlatformFindInteractionControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformFindInteractionController is not implemented on the current platform.');
  }

  /// Creates a new [PlatformPrintJobController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [PrintJobController] in `tmpflutter_webview` instead.
  PlatformPrintJobController createPlatformPrintJobController(
    PlatformPrintJobControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformPrintJobController is not implemented on the current platform.');
  }

  /// Creates a new [PlatformPullToRefreshController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [PullToRefreshController] in `tmpflutter_webview` instead.
  PlatformPullToRefreshController createPlatformPullToRefreshController(
    PlatformPullToRefreshControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformPullToRefreshController is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebAuthenticationSession].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebAuthenticationSession] in `tmpflutter_webview` instead.
  PlatformWebAuthenticationSession createPlatformWebAuthenticationSession(
    PlatformWebAuthenticationSessionCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebAuthenticationSession is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformWebAuthenticationSession] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebAuthenticationSession] in `tmpflutter_webview` instead.
  PlatformWebAuthenticationSession
      createPlatformWebAuthenticationSessionStatic() {
    throw UnimplementedError(
        'createPlatformWebAuthenticationSessionStatic is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebMessageChannel].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebMessageChannel] in `tmpflutter_webview` instead.
  PlatformWebMessageChannel createPlatformWebMessageChannel(
    PlatformWebMessageChannelCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebMessageChannel is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebMessageChannel] in `tmpflutter_webview` instead.
  PlatformWebMessageChannel createPlatformWebMessageChannelStatic() {
    throw UnimplementedError(
        'createPlatformWebMessageChannelStatic is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebMessageListener].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebMessageListener] in `tmpflutter_webview` instead.
  PlatformWebMessageListener createPlatformWebMessageListener(
    PlatformWebMessageListenerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebMessageListener is not implemented on the current platform.');
  }

  /// Creates a new [PlatformJavaScriptReplyProxy].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [JavaScriptReplyProxy] in `tmpflutter_webview` instead.
  PlatformJavaScriptReplyProxy createPlatformJavaScriptReplyProxy(
    PlatformJavaScriptReplyProxyCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformJavaScriptReplyProxy is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebMessagePort].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebMessagePort] in `tmpflutter_webview` instead.
  PlatformWebMessagePort createPlatformWebMessagePort(
    PlatformWebMessagePortCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebMessagePort is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebStorage] in `tmpflutter_webview` instead.
  PlatformWebStorage createPlatformWebStorage(
    PlatformWebStorageCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebStorage is not implemented on the current platform.');
  }

  /// Creates a new [PlatformLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [LocalStorage] in `tmpflutter_webview` instead.
  PlatformLocalStorage createPlatformLocalStorage(
    PlatformLocalStorageCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformLocalStorage is not implemented on the current platform.');
  }

  /// Creates a new [PlatformSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [PlatformSessionStorage] in `tmpflutter_webview` instead.
  PlatformSessionStorage createPlatformSessionStorage(
    PlatformSessionStorageCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformSessionStorage is not implemented on the current platform.');
  }

  /// Creates a new [PlatformHeadlessInAppWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [HeadlessInAppWebView] in `tmpflutter_webview` instead.
  PlatformHeadlessInAppWebView createPlatformHeadlessInAppWebView(
    PlatformHeadlessInAppWebViewCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformHeadlessInAppWebView is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebStorageManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CookieManager] in `tmpflutter_webview` instead.
  PlatformWebStorageManager createPlatformWebStorageManager(
    PlatformWebStorageManagerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebStorageManager is not implemented on the current platform.');
  }

  /// Creates a new [PlatformHttpAuthCredentialDatabase].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [HttpAuthCredentialDatabase] in `tmpflutter_webview` instead.
  PlatformHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    PlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformHttpAuthCredentialDatabase is not implemented on the current platform.');
  }

  /// Creates a new [PlatformInAppBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [InAppBrowser] in `tmpflutter_webview` instead.
  PlatformInAppBrowser createPlatformInAppBrowser(
    PlatformInAppBrowserCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformInAppBrowser is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformInAppBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [InAppBrowser] in `tmpflutter_webview` instead.
  PlatformInAppBrowser createPlatformInAppBrowserStatic() {
    throw UnimplementedError(
        'createPlatformInAppBrowserStatic is not implemented on the current platform.');
  }

  /// Creates a new [PlatformProcessGlobalConfig].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ProcessGlobalConfig] in `tmpflutter_webview` instead.
  PlatformProcessGlobalConfig createPlatformProcessGlobalConfig(
    PlatformProcessGlobalConfigCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformProcessGlobalConfig is not implemented on the current platform.');
  }

  /// Creates a new [PlatformProxyController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ProxyController] in `tmpflutter_webview` instead.
  PlatformProxyController createPlatformProxyController(
    PlatformProxyControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformProxyController is not implemented on the current platform.');
  }

  /// Creates a new [PlatformServiceWorkerController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ServiceWorkerController] in `tmpflutter_webview` instead.
  PlatformServiceWorkerController createPlatformServiceWorkerController(
    PlatformServiceWorkerControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformServiceWorkerController is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformServiceWorkerController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ServiceWorkerController] in `tmpflutter_webview` instead.
  PlatformServiceWorkerController
      createPlatformServiceWorkerControllerStatic() {
    throw UnimplementedError(
        'createPlatformServiceWorkerControllerStatic is not implemented on the current platform.');
  }

  /// Creates a new [PlatformTracingController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [TracingController] in `tmpflutter_webview` instead.
  PlatformTracingController createPlatformTracingController(
    PlatformTracingControllerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformTracingController is not implemented on the current platform.');
  }

  /// Creates a new [PlatformAssetsPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [AssetsPathHandler] in `tmpflutter_webview` instead.
  PlatformAssetsPathHandler createPlatformAssetsPathHandler(
    PlatformAssetsPathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformAssetsPathHandler is not implemented on the current platform.');
  }

  /// Creates a new [PlatformResourcesPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ResourcesPathHandler] in `tmpflutter_webview` instead.
  PlatformResourcesPathHandler createPlatformResourcesPathHandler(
    PlatformResourcesPathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformResourcesPathHandler is not implemented on the current platform.');
  }

  /// Creates a new [PlatformInternalStoragePathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [InternalStoragePathHandler] in `tmpflutter_webview` instead.
  PlatformInternalStoragePathHandler createPlatformInternalStoragePathHandler(
    PlatformInternalStoragePathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformInternalStoragePathHandler is not implemented on the current platform.');
  }

  /// Creates a new [PlatformWebViewFeature].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebViewFeature] in `tmpflutter_webview` instead.
  PlatformWebViewFeature createPlatformWebViewFeature(
    PlatformWebViewFeatureCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformWebViewFeature is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformWebViewFeature] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [WebViewFeature] in `tmpflutter_webview` instead.
  PlatformWebViewFeature createPlatformWebViewFeatureStatic() {
    throw UnimplementedError(
        'createPlatformWebViewFeatureStatic is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformInAppLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [DefaultInAppLocalhostServer] in `tmpflutter_webview` instead.
  PlatformInAppLocalhostServer createPlatformInAppLocalhostServer(
      PlatformInAppLocalhostServerCreationParams params) {
    return DefaultInAppLocalhostServer(params);
  }

  /// Creates a new [PlatformChromeSafariBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ChromeSafariBrowser] in `tmpflutter_webview` instead.
  PlatformChromeSafariBrowser createPlatformChromeSafariBrowser(
    PlatformChromeSafariBrowserCreationParams params,
  ) {
    throw UnimplementedError(
        'createPlatformChromeSafariBrowser is not implemented on the current platform.');
  }

  /// Creates a new empty [PlatformChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [ChromeSafariBrowser] in `tmpflutter_webview` instead.
  PlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    throw UnimplementedError(
        'createPlatformChromeSafariBrowserStatic is not implemented on the current platform.');
  }
}
