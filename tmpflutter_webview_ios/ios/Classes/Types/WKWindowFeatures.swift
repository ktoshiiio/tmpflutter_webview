//
//  WKWindowFeatures.swift
//  tmpflutter_webview
//
//  Created by Lorenzo Pichilli on 19/02/21.
//

import Foundation
import WebKit

extension WKWindowFeatures {
    public func toMap () -> [String:Any?] {
        return [
            "allowsResizing": allowsResizing,
            "height": height,
            "menuBarVisibility": menuBarVisibility,
            "statusBarVisibility": statusBarVisibility,
            "toolbarsVisibility": toolbarsVisibility,
            "width": width,
            "x": x,
            "y": y
        ]
    }
}
