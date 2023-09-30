//
//  UIViewDSL+Constraints.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit.NSLayoutConstraint

extension UIView {

    public func ibConstraints(to view: UIView, guide: LayoutGuide, anchors: ViewAnchor...) -> [NSLayoutConstraint] {
        switch guide {
        case .view:
            return IBConstraints.generateConstraints(from: self, to: view, anchors: anchors)
        case .viewMargins:
            return IBConstraints.generateConstraints(from: self, to: view.layoutMarginsGuide, anchors: anchors)
        case .viewSafeArea:
            return IBConstraints.generateConstraints(from: self, to: view.safeAreaLayoutGuide, anchors: anchors)
        }
    }
}

extension NSLayoutConstraint {
    
    static public func activate(@NSLayoutConstraintBuilder _ block: () -> [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(block())
    }
    
    @discardableResult
    public func ibPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout NSLayoutConstraint?) -> Self {
        outlet = self
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout NSLayoutConstraint) -> Self {
        outlet = self
        return self
    }
}

enum IBConstraints {

    static func generateConstraints(from view: UIView, to target: Any, anchors: [ViewAnchor]) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        
        for anchor in anchors {
            switch anchor {
            case .left(let value):
                constraints.append(view.leftAnchor.constraint(equalTo: (target as? UILayoutGuide)?.leftAnchor ?? (target as! UIView).leftAnchor, constant: value))
            case .right(let value):
                constraints.append(view.rightAnchor.constraint(equalTo: (target as? UILayoutGuide)?.rightAnchor ?? (target as! UIView).rightAnchor, constant: value))
            case .top(let value):
                constraints.append(view.topAnchor.constraint(equalTo: (target as? UILayoutGuide)?.topAnchor ?? (target as! UIView).topAnchor, constant: value))
            case .bottom(let value):
                constraints.append(view.bottomAnchor.constraint(equalTo: (target as? UILayoutGuide)?.bottomAnchor ?? (target as! UIView).bottomAnchor, constant: value))
            case .centerX(let value):
                constraints.append(view.centerXAnchor.constraint(equalTo: (target as? UILayoutGuide)?.centerXAnchor ?? (target as! UIView).centerXAnchor, constant: value))
            case .centerY(let value):
                constraints.append(view.centerYAnchor.constraint(equalTo: (target as? UILayoutGuide)?.centerYAnchor ?? (target as! UIView).centerYAnchor, constant: value))
            case .leading(let value):
                constraints.append(view.leadingAnchor.constraint(equalTo: (target as? UILayoutGuide)?.leadingAnchor ?? (target as! UIView).leadingAnchor, constant: value))
            case .trailing(let value):
                constraints.append(view.trailingAnchor.constraint(equalTo: (target as? UILayoutGuide)?.trailingAnchor ?? (target as! UIView).trailingAnchor, constant: value))
            case .all:
                constraints.append(contentsOf: generateConstraints(from: view, to: target, anchors: [.top, .bottom, .left, .right]))
            }
        }
        
        return constraints
    }
}

public enum LayoutGuide {
    case view
    case viewMargins
    case viewSafeArea
}

public enum ViewAnchor {
    case left(CGFloat)
    case right(CGFloat)
    case top(CGFloat)
    case bottom(CGFloat)
    case centerX(CGFloat)
    case centerY(CGFloat)
    case leading(CGFloat)
    case trailing(CGFloat)
    case all
    
    static public var left: ViewAnchor { return .left(.zero) }
    static public var right: ViewAnchor { return .right(.zero) }
    static public var top: ViewAnchor { return .top(.zero) }
    static public var bottom: ViewAnchor { return .bottom(.zero) }
    static public var centerX: ViewAnchor { return .centerX(.zero) }
    static public var centerY: ViewAnchor { return .centerY(.zero) }
    static public var leading: ViewAnchor { return .leading(.zero) }
    static public var trailing: ViewAnchor { return .trailing(.zero) }
}
