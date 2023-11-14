//
//  IBFreeFormViewRepresentable.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 14/11/2023.
//

#if DEBUG

import UIKit
import SwiftUI

public struct IBFreeFormViewRepresentable<T: UIView>: UIViewControllerRepresentable {

    private let viewMaker: (Context) -> T

    public init(_ view: T) {
        self.viewMaker = { _ in
            view
        }
    }

    public init(viewMaker: @escaping (Context) -> T) {
        self.viewMaker = viewMaker
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let view = viewMaker(context)
        controller.view.addSubview(view)
        view.frame = controller.view.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = true

        let freeFormContainer = ContainerViewController()
        _ = freeFormContainer.view
        freeFormContainer.childViewController = controller
        return freeFormContainer
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

#endif
