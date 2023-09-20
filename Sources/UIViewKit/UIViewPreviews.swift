//
//  UIViewPreviews.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

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
