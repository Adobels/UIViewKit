//
//  UIViewDebug.swift
//
//
//  Created by Blazej SLEBODA on 19/09/2023.
//

import UIKit

public struct UIViewDebug {
    
    public static func showFrames(of view: UIView, includeGivenView: Bool, includeUIKitPrivateViews: Bool) {
        if includeGivenView {
            view.layer.borderWidth = 1
        }
        allSubviews(of: view, includeUIKitPrivateViews: includeUIKitPrivateViews).forEach {
            $0.layer.borderWidth = 1
        }
    }
    
    public static func allSubviews(of view: UIView, includeUIKitPrivateViews: Bool = false) -> [UIView] {
        var all = [UIView]()
        
        func getSubviews(view: UIView) {
            for subview in view.subviews {
                if includeUIKitPrivateViews || !"\(type(of: subview.self))".hasPrefix("_") {
                    all.append(subview)
                    getSubviews(view: subview)
                }
            }
        }
        
        getSubviews(view: view)
        return all
    }
}
