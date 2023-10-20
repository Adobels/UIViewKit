//
//  UIViewPreviews.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import SwiftUI
@available(iOS 13.0, *)
struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {

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
struct ViewPreview<View: UIView>: UIViewRepresentable {
    
    public var view: UIView

    public init(_ view: @escaping @autoclosure () -> UIView) {
        self.view = view()
    }
    
    public init(_ view: @escaping () -> UIView) {
        self.view = view()
    }
    
    public func makeUIView(context: Context) -> UIView {
        let rootView = UIView(); rootView {
            view.ibAttributes {
                $0.topAnchor.constraint(equalTo: rootView.topAnchor).ibPriority(.init(1))
                $0.leftAnchor.constraint(equalTo: rootView.leftAnchor)
                $0.rightAnchor.constraint(equalTo: rootView.rightAnchor)
                $0.bottomAnchor.constraint(equalTo: rootView.bottomAnchor).ibPriority(.init(1))
                $0.centerXAnchor.constraint(equalTo: rootView.centerXAnchor)
                $0.centerYAnchor.constraint(equalTo: rootView.centerYAnchor)
            }
        }
        rootView.translatesAutoresizingMaskIntoConstraints = true
        rootView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return rootView
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) { }
}
