package com.pichillilorenzo.tmpflutter_webview_android.in_app_browser;

import android.content.Intent;

public interface ActivityResultListener {
  /** @return true if the result has been handled. */
  boolean onActivityResult(int requestCode, int resultCode, Intent data);
}
