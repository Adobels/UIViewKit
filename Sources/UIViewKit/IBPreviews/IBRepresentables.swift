//
//  IBRepresentableViewController.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 02/09/2025.
//

import UIKit
import SwiftUI

@available(iOS, introduced: 13, obsoleted: 17)
public struct IBRepresentableViewController: UIViewControllerRepresentable {

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

@available(iOS, introduced: 13, obsoleted: 17)
public struct IBRepresentableView: UIViewRepresentable {
    
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
