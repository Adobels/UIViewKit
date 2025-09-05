//
//  IBPreviewRepresentable.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 02/09/2025.
//

import UIKit
import SwiftUI

public func IBPreviewRepresentable(view: UIView) -> some UIViewRepresentable {
    IBRepresentableView(view)
}

public func IBPreviewRepresentable(_ viewMaker: @escaping () -> UIView) -> some UIViewRepresentable {
    IBRepresentableView(viewMaker)
}
public func IBPreviewRepresentable(viewController: UIViewController) -> some UIViewControllerRepresentable {
    IBRepresentableViewController(viewController)
}

public func IBPreviewRepresentable(_ viewControllerMaker: @escaping () -> UIViewController) -> some UIViewControllerRepresentable {
    IBRepresentableViewController(viewControllerMaker)
}

private struct IBRepresentableViewController: UIViewControllerRepresentable {

    public typealias UIViewControllerType = UIViewController

    private let viewControllerMaker: () -> UIViewController

    public init(_ viewController: UIViewController) {
        viewControllerMaker = { viewController }
    }

    public init(_ viewControllerMaker: @escaping () -> UIViewController) {
        self.viewControllerMaker = viewControllerMaker
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        viewControllerMaker()
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

private struct IBRepresentableView: UIViewRepresentable {

    public typealias UIViewType = UIView
    
    private let viewMaker: () -> UIView

    public init(_ view: UIView) {
        viewMaker = { view }
    }

    public init (_ viewMaker: @escaping () -> UIView) {
        self.viewMaker = viewMaker
    }

    public func makeUIView(context: Context) -> UIView {
        viewMaker()
    }

    public func updateUIView(_ uiView: UIView, context: Context) { }
}
