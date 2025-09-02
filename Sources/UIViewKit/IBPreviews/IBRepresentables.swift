//
//  IBRepresentableViewController.swift
//  UIViewKit
//
//  Created by blz on 02/09/2025.
//

import UIKit
import SwiftUI

public struct IBRepresentableViewController: UIViewControllerRepresentable {

    public typealias UIViewControllerType = UIViewController

    private let viewControllerMaker: () -> UIViewController

    init(_ viewController: UIViewController) {
        viewControllerMaker = { viewController }
    }

    init(_ viewControllerMaker: @escaping () -> UIViewController) {
        self.viewControllerMaker = viewControllerMaker
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        viewControllerMaker()
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

public struct IBRepresentableView: UIViewRepresentable {
    
    public typealias UIViewType = UIView
    
    private let viewMaker: () -> UIView
    
    init(_ view: UIView) {
        viewMaker = { view }
    }
    
    init (_ viewMaker: @escaping () -> UIView) {
        self.viewMaker = viewMaker
    }
    
    public func makeUIView(context: Context) -> UIView {
        viewMaker()
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) { }
}
