//
//  IBRepresentableForViewController.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
public struct IBRepresentableForViewController: UIViewControllerRepresentable {

    private let viewController: UIViewController

    public init(_ viewController: @escaping @autoclosure () -> UIViewController) {
        self.viewController = viewController()
    }

    public init(_ viewController: @escaping () -> UIViewController) {
        self.viewController = viewController()
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }

}

#endif
