//
//  UIViewDSL.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/09/2023.
//

import UIKit

public protocol UIViewDSL { }; extension UIView: UIViewDSL { }
public protocol NSObjectExtensions {}; extension NSObject: NSObjectExtensions { }

@MainActor
class UIViewDSLEngine {
    static let shared = UIViewDSLEngine()
    
    var defineSubviewsDepthCallCounter: Int = .zero {
        willSet {
            if newValue == .zero {
                activateAutoLayout()
            }
        }
    }
    
    var constraintsToApply: [(UIView, [NSLayoutConstraint])] = []
    
    private init() {}
    
    func activateAutoLayout() {
        constraintsToApply.forEach { view, constraints in
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate(constraints)
        }
        constraintsToApply.removeAll()
    }
}

extension NSObjectExtensions {
    
    @discardableResult
    func apply(_ block: (Self) -> Void) -> Self{
        block(self)
        return self
    }
}

@MainActor
extension UIViewDSL where Self: UIView {

    @discardableResult
    public func ibOutlet(_ outlet: inout Self?) -> Self {
        outlet = self
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout Self) -> Self {
        outlet = self
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout Self?, @UIViewBuilder _ content: () -> [UIView]) -> Self {
        outlet = self
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout Self?, @UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        outlet = self
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout Self, @UIViewBuilder _ content: () -> [UIView]) -> Self {
        outlet = self
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func ibOutlet(_ outlet: inout Self, @UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        outlet = self
        coreDefineSubviews(content)
        return self
    }

    @discardableResult
    public func ibOutlet(in outlet: inout [Self]) -> Self {
        outlet.append(self)
        return self
    }
    
    @discardableResult
    public func ibOutlet(in outlet: inout [Self], @UIViewBuilder _ content: () -> [UIView]) -> Self {
        outlet.append(self)
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func ibOutlet(in outlet: inout [Self], @UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        outlet.append(self)
        coreDefineSubviews(content)
        return self
    }
}

@MainActor
extension UIViewDSL where Self: UIView {

    @discardableResult
    public func ibSubviews(@UIViewBuilder _ content: () -> [UIView]) -> Self {
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func ibSubviews(@UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func callAsFunction(@UIViewBuilder _ content: () -> [UIView]) -> Self {
        coreDefineSubviews(content)
        return self
    }
    
    @discardableResult
    public func callAsFunction(@UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        coreDefineSubviews(content)
        return self
    }
    
    func coreDefineSubviews(@UIViewBuilder _ content: (UIView) -> [UIView]) {
        UIViewDSLEngine.shared.defineSubviewsDepthCallCounter += 1
        let subviews = content(self)
        if let stackView = self as? UIStackView {
            subviews.forEach { stackView.addArrangedSubview($0) }
        } else {
            subviews.forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        UIViewDSLEngine.shared.defineSubviewsDepthCallCounter -= 1
    }
    
    func coreDefineSubviews(@UIViewBuilder _ content: () -> [UIView]) {
        UIViewDSLEngine.shared.defineSubviewsDepthCallCounter += 1
        let subviews = content()
        if let stackView = self as? UIStackView {
            subviews.forEach { stackView.addArrangedSubview($0) }
        } else {
            subviews.forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        UIViewDSLEngine.shared.defineSubviewsDepthCallCounter -= 1
    }

}

extension UIViewDSL where Self: UIView {

    @MainActor
    @discardableResult
    public func ibAttributes(@NSLayoutConstraintBuilder _ block: (Self) -> [NSLayoutConstraint]) -> Self {
        UIViewDSLEngine.shared.constraintsToApply.append((self, block(self)))
        return self
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
}

@resultBuilder
public enum UIViewBuilder {
    
    public static func buildBlock(_ components: [UIView]...) -> [UIView] {
        components.flatMap { $0 }
    }
    
    public static func buildExpression(_ expression: UIView) -> [UIView] {
        [expression]
    }
    
    public static func buildExpression(_ expression: [UIView]) -> [UIView] {
        expression
    }
    
    public static func buildExpression(_ expression: Void) -> [UIView] {
        []
    }
    
    public static func buildOptional(_ component: [UIView]?) -> [UIView] {
        component.flatMap { $0 } ?? []
    }
    
    public static func buildEither(first component: [UIView]) -> [UIView] {
        component
    }
    
    public static func buildEither(second component: [UIView]) -> [UIView] {
        component
    }
}

@resultBuilder
public enum NSLayoutConstraintBuilder {
    
    public static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }
    
    public static func buildBlock(_ components: NSLayoutConstraint...) -> [NSLayoutConstraint] {
        components
    }
    
    public static func buildOptional(_ component: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        component ?? []
    }
    
    public static func buildEither(first component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }
    
    public static func buildEither(second component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }
    
    public static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }
    
    public static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }
    
    public static func buildExpression(_ expression: Void) -> [NSLayoutConstraint] {
        []
    }
}

public class HorizontalStack: UIStackView {
    public convenience init(frame: CGRect = .zero, spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) {
        self.init(frame: frame)
        self.axis = .horizontal
        if let alignment {
            self.alignment = alignment
        }
        if let distribution {
            self.distribution = distribution
        }
        if let spacing {
            self.spacing = spacing
        }
    }
    public required init(coder: NSCoder) {
        fatalError()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
    }
}

public class VerticalStack: UIStackView {
    public convenience init(frame: CGRect = .zero, spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) {
        self.init(frame: frame)
        if let alignment {
            self.alignment = alignment
        }
        if let distribution {
            self.distribution = distribution
        }
        if let spacing {
            self.spacing = spacing
        }
    }
    
    public required init(coder: NSCoder) {
        fatalError()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
    }
}

public class UISpacer: UIView {
    init(frame: CGRect = .zero, widthConstant: CGFloat = .zero, heightConstant: CGFloat = .zero) {
        super.init(frame: frame)
        ibAttributes {
            if widthConstant > .zero {
                $0.widthAnchor.constraint(equalToConstant: widthConstant)
            }
            if heightConstant > .zero {
                $0.heightAnchor.constraint(equalToConstant: heightConstant)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension UIStackView {
    
    public convenience init(frame: CGRect = .zero, axis: NSLayoutConstraint.Axis, spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) {
        self.init(frame: frame)
        self.axis = axis
        if let alignment {
            self.alignment = alignment
        }
        if let distribution {
            self.distribution = distribution
        }
        if let spacing {
            self.spacing = spacing
        }
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

extension UIView {

    public func ibConstraints(to view: UIView, guide: LayoutGuide, anchors: ViewAnchor...) -> [NSLayoutConstraint] {
        switch guide {
        case .view:
            return applyConstraints(to: view, anchors: anchors)
        case .viewMargins:
            return applyConstraints(to: view.layoutMarginsGuide, anchors: anchors)
        case .viewSafeArea:
            return applyConstraints(to: view.safeAreaLayoutGuide, anchors: anchors)
        }
    }
    
    private func applyConstraints(to target: Any, anchors: [ViewAnchor]) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        
        for anchor in anchors {
            switch anchor {
            case .left(let value):
                constraints.append(leftAnchor.constraint(equalTo: (target as? UILayoutGuide)?.leftAnchor ?? (target as? UIView)?.leftAnchor ?? leftAnchor, constant: value))
            case .right(let value):
                constraints.append(rightAnchor.constraint(equalTo: (target as? UILayoutGuide)?.rightAnchor ?? (target as? UIView)?.rightAnchor ?? rightAnchor, constant: value))
            case .top(let value):
                constraints.append(topAnchor.constraint(equalTo: (target as? UILayoutGuide)?.topAnchor ?? (target as? UIView)?.topAnchor ?? topAnchor, constant: value))
            case .bottom(let value):
                constraints.append(bottomAnchor.constraint(equalTo: (target as? UILayoutGuide)?.bottomAnchor ?? (target as? UIView)?.bottomAnchor ?? bottomAnchor, constant: value))
            case .centerX(let value):
                constraints.append(centerXAnchor.constraint(equalTo: (target as? UILayoutGuide)?.centerXAnchor ?? (target as? UIView)?.centerXAnchor ?? centerXAnchor, constant: value))
            case .centerY(let value):
                constraints.append(centerYAnchor.constraint(equalTo: (target as? UILayoutGuide)?.centerYAnchor ?? (target as? UIView)?.centerYAnchor ?? centerYAnchor, constant: value))
            case .leading(let value):
                constraints.append(leadingAnchor.constraint(equalTo: (target as? UILayoutGuide)?.leadingAnchor ?? (target as? UIView)?.leadingAnchor ?? leadingAnchor, constant: value))
            case .trailing(let value):
                constraints.append(trailingAnchor.constraint(equalTo: (target as? UILayoutGuide)?.trailingAnchor ?? (target as? UIView)?.trailingAnchor ?? trailingAnchor, constant: value))
            case .all:
                constraints.append(contentsOf: applyConstraints(to: target, anchors: [.top, .bottom, .left, .right]))
            }
        }
        
        return constraints
    }
}

import SwiftUI
@available(iOS 13.0, *)
public struct PreviewViewController<ViewController: UIViewController>: UIViewControllerRepresentable {

    public var viewController: ViewController
    
    public init(_ viewController: @escaping @autoclosure () -> ViewController) {
        self.viewController = viewController()
    }
    
    public init(_ viewController: @escaping () -> ViewController) {
        self.viewController = viewController()
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    
}

import SwiftUI
@available(iOS 13.0, *)
public struct ViewPreview<View: UIView>: UIViewRepresentable {
    
    public var view: UIView

    public init(_ view: @escaping @autoclosure () -> UIView) {
        self.view = view()
    }
    
    public init(_ view: @escaping () -> UIView) {
        self.view = view()
    }
    
    public func makeUIView(context: Context) -> UIView {
        UIView() { superview in
            view.ibAttributes {
                $0.topAnchor.constraint(equalTo: superview.topAnchor).ibPriority(.init(1))
                $0.leftAnchor.constraint(equalTo: superview.leftAnchor)
                $0.rightAnchor.constraint(equalTo: superview.rightAnchor)
                $0.bottomAnchor.constraint(equalTo: superview.bottomAnchor).ibPriority(.init(1))
                $0.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
                $0.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            }
        }
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) { }
}
