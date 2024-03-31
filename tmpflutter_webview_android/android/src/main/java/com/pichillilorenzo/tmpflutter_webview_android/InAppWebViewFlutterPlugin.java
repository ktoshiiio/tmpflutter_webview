package com.pichillilorenzo.tmpflutter_webview_android;

import android.app.Activity;
import android.content.Context;
import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.pichillilorenzo.tmpflutter_webview_android.chrome_custom_tabs.ChromeSafariBrowserManager;
import com.pichillilorenzo.tmpflutter_webview_android.credential_database.CredentialDatabaseHandler;
import com.pichillilorenzo.tmpflutter_webview_android.headless_in_app_webview.HeadlessInAppWebViewManager;
import com.pichillilorenzo.tmpflutter_webview_android.in_app_browser.InAppBrowserManager;
import com.pichillilorenzo.tmpflutter_webview_android.print_job.PrintJobManager;
import com.pichillilorenzo.tmpflutter_webview_android.process_global_config.ProcessGlobalConfigManager;
import com.pichillilorenzo.tmpflutter_webview_android.proxy.ProxyManager;
import com.pichillilorenzo.tmpflutter_webview_android.service_worker.ServiceWorkerManager;
import com.pichillilorenzo.tmpflutter_webview_android.tracing.TracingControllerManager;
import com.pichillilorenzo.tmpflutter_webview_android.webview.FlutterWebViewFactory;
import com.pichillilorenzo.tmpflutter_webview_android.webview.InAppWebViewManager;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformViewRegistry;
import io.flutter.view.FlutterView;
import android.util.Log;

public class InAppWebViewFlutterPlugin implements FlutterPlugin, ActivityAware {

  protected static final String LOG_TAG = "InAppWebViewFlutterPL";

  @Nullable
  public PlatformUtil platformUtil;
  @Nullable
  public InAppBrowserManager inAppBrowserManager;
  @Nullable
  public HeadlessInAppWebViewManager headlessInAppWebViewManager;
  @Nullable
  public ChromeSafariBrowserManager chromeSafariBrowserManager;
  @Nullable
  public InAppWebViewManager inAppWebViewManager;
  @Nullable
  public MyCookieManager myCookieManager;
  @Nullable
  public CredentialDatabaseHandler credentialDatabaseHandler;
  @Nullable
  public MyWebStorage myWebStorage;
  @Nullable
  public ServiceWorkerManager serviceWorkerManager;
  @Nullable
  public WebViewFeatureManager webViewFeatureManager;
  @Nullable
  public ProxyManager proxyManager;
  @Nullable
  public PrintJobManager printJobManager;
  @Nullable
  public TracingControllerManager tracingControllerManager;
  @Nullable
  public ProcessGlobalConfigManager processGlobalConfigManager;
  public FlutterWebViewFactory flutterWebViewFactory;
  public Context applicationContext;
  public PluginRegistry.Registrar registrar;
  public BinaryMessenger messenger;
  public FlutterPlugin.FlutterAssets flutterAssets;
  @Nullable
  public ActivityPluginBinding activityPluginBinding;
  @Nullable
  public Activity activity;
  @SuppressWarnings("deprecation")
  public FlutterView flutterView;

  public InAppWebViewFlutterPlugin() {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java is called");
  }

  @SuppressWarnings("deprecation")
  public static void registerWith(PluginRegistry.Registrar registrar) {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java registerWith is called");
    final InAppWebViewFlutterPlugin instance = new InAppWebViewFlutterPlugin();
    instance.registrar = registrar;
    instance.onAttachedToEngine(
            registrar.context(), registrar.messenger(), registrar.activity(), registrar.platformViewRegistry(), registrar.view());
  }

  @Override
  public void onAttachedToEngine(FlutterPluginBinding binding) {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java OnAttachedToEngine is called!!!!");
    this.flutterAssets = binding.getFlutterAssets();

    // Shared.activity could be null or not.
    // It depends on who is called first between onAttachedToEngine event and onAttachedToActivity event.
    //
    // See https://github.com/pichillilorenzo/flutter_inappwebview/issues/390#issuecomment-647039084
    onAttachedToEngine(
            binding.getApplicationContext(), binding.getBinaryMessenger(), this.activity, binding.getPlatformViewRegistry(), null);
  }

  @SuppressWarnings("deprecation")
  private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger, Activity activity, PlatformViewRegistry platformViewRegistry, FlutterView flutterView) {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java OnAttachedToEngine inside is called!!!!");
    this.applicationContext = applicationContext;
    this.activity = activity;
    this.messenger = messenger;
    this.flutterView = flutterView;

    inAppBrowserManager = new InAppBrowserManager(this);
    headlessInAppWebViewManager = new HeadlessInAppWebViewManager(this);
    chromeSafariBrowserManager = new ChromeSafariBrowserManager(this);
    flutterWebViewFactory = new FlutterWebViewFactory(this);
    platformViewRegistry.registerViewFactory(
            FlutterWebViewFactory.VIEW_TYPE_ID, flutterWebViewFactory);

    platformUtil = new PlatformUtil(this);
    inAppWebViewManager = new InAppWebViewManager(this);
    myCookieManager = new MyCookieManager(this);
    myWebStorage = new MyWebStorage(this);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      serviceWorkerManager = new ServiceWorkerManager(this);
    }
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      credentialDatabaseHandler = new CredentialDatabaseHandler(this);
    }
    webViewFeatureManager = new WebViewFeatureManager(this);
    proxyManager = new ProxyManager(this);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      printJobManager = new PrintJobManager(this);
    }
    tracingControllerManager = new TracingControllerManager(this);
    processGlobalConfigManager = new ProcessGlobalConfigManager(this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java onDetachedFromEngine is called!!!!");
    if (platformUtil != null) {
      platformUtil.dispose();
      platformUtil = null;
    }
    if (inAppBrowserManager != null) {
      inAppBrowserManager.dispose();
      inAppBrowserManager = null;
    }
    if (headlessInAppWebViewManager != null) {
      headlessInAppWebViewManager.dispose();
      headlessInAppWebViewManager = null;
    }
    if (chromeSafariBrowserManager != null) {
      chromeSafariBrowserManager.dispose();
      chromeSafariBrowserManager = null;
    }
    if (myCookieManager != null) {
      myCookieManager.dispose();
      myCookieManager = null;
    }
    if (myWebStorage != null) {
      myWebStorage.dispose();
      myWebStorage = null;
    }
    if (credentialDatabaseHandler != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      credentialDatabaseHandler.dispose();
      credentialDatabaseHandler = null;
    }
    if (inAppWebViewManager != null) {
      inAppWebViewManager.dispose();
      inAppWebViewManager = null;
    }
    if (serviceWorkerManager != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      serviceWorkerManager.dispose();
      serviceWorkerManager = null;
    }
    if (webViewFeatureManager != null) {
      webViewFeatureManager.dispose();
      webViewFeatureManager = null;
    }
    if (proxyManager != null) {
      proxyManager.dispose();
      proxyManager = null;
    }
    if (printJobManager != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      printJobManager.dispose();
      printJobManager = null;
    }
    if (tracingControllerManager != null) {
      tracingControllerManager.dispose();
      tracingControllerManager = null;
    }
    if (processGlobalConfigManager != null) {
      processGlobalConfigManager.dispose();
      processGlobalConfigManager = null;
    }
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java onAttachedToActivity is called!!!!");
    this.activityPluginBinding = activityPluginBinding;
    this.activity = activityPluginBinding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java onDetachedFromActivityForConfigChanges is called!!!!");
    this.activityPluginBinding = null;
    this.activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java onReattachedToActivityForConfigChanges is called!!!!");
    this.activityPluginBinding = activityPluginBinding;
    this.activity = activityPluginBinding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    Log.e("TAG", "InAppWebViewFlutterPlugin.java onDetachedFromActivity is called!!!!");
    this.activityPluginBinding = null;
    this.activity = null;
  }
}
