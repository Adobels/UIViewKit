//
//  IBRepresentableForViewController.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
public struct IBRepresentableForViewController<ViewController: UIViewController>: UIViewControllerRepresentable {

    private let viewController: ViewController

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

#endif
