//
//  IBDebug.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 19/09/2023.
//

import UIKit

public final class IBDebug {
    
    private init() {}

    public static func showColors(of view: UIView, includeGivenView: Bool = true, includeUIKitPrivateViews: Bool = false) {
        let colors = [UIColor.red, .blue, .brown, .cyan, .darkGray, .magenta, .green, .lightGray, .orange, .purple, .yellow]
        if includeGivenView {
            view.layer.borderWidth = 1
        }
        allSubviews(of: view, includeUIKitPrivateViews: includeUIKitPrivateViews).forEach {
            $0.backgroundColor = colors.randomElement()!
        }
    }

    public static func showFrames(of view: UIView, includeGivenView: Bool = true, includeUIKitPrivateViews: Bool = false) {
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

    public static func allSubviewsPrettyString(of view: UIView, includeGivenView: Bool, includeUIKitPrivateViews: Bool = false) -> String {
        let allSubviews: [UIView]
        if includeGivenView {
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

    public static func allSubviewsPrettyPrint(of view: UIView, includeGivenView: Bool, includeUIKitPrivateViews: Bool = false) {
        print(allSubviewsPrettyString(of: view, includeGivenView: includeGivenView, includeUIKitPrivateViews: includeUIKitPrivateViews), separator: "\n")
    }

    public static func showViewsWhichHasAmbiguousLayout(for view: UIView) {

        IBHelper.allSubviews(of: view).forEach { subview in
            if subview is UIDebugView {
                subview.removeConstraints(subview.constraints)
                subview.removeFromSuperview()
            }
            subview.exerciseAmbiguityInLayout()
            if subview.hasAmbiguousLayout {
                let debugView = UIDebugView()
                subview.addSubview(debugView)
                debugView.frame = .init(origin: .zero, size: subview.frame.size)
            }
        }
    }

    private class UIDebugView: UIView {

        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .red.withAlphaComponent(0.5)
            isUserInteractionEnabled = false
        }

        required init?(coder: NSCoder) {
            fatalError()
        }
    }
}

final class IBHelper {
    static func allSubviews(of view: UIView) -> [UIView] {
        view.subviews.flatMap {
            [$0] + IBHelper.allSubviews(of: $0)
        }
    }
}
