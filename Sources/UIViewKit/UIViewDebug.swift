//
//  UIViewDebug.swift
//  UIViewKit
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
    
    public static func prettyPrintAllSubviews(of view: UIView, includeItself: Bool, includeUIKitPrivateViews: Bool) -> String {
        let allSubviews: [UIView]
        if includeItself {
            allSubviews = [view] + self.allSubviews(of: view, includeUIKitPrivateViews: includeUIKitPrivateViews)
        } else {
            allSubviews = self.allSubviews(of: view, includeUIKitPrivateViews: includeUIKitPrivateViews)
        }
        var output = ""
        
        func getIndentation(for view: UIView) -> String {
            var depth = 0
            var current: UIView? = view.superview
            while let safeCurrent = current {
                depth += 1
                current = safeCurrent.superview
            }
            return String(repeating: "    ", count: depth)
        }
        
        
        for subview in allSubviews {
            let indentation = getIndentation(for: subview)
            output += "\(indentation)- \(type(of: subview)) tamic \(subview.translatesAutoresizingMaskIntoConstraints) constraints: \(subview.constraints.count)\n"
        }
        
        return output
    }
}
