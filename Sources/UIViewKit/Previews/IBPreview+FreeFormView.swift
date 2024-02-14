//
//  IBPreview+FreeFormView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 14/11/2023.
//

#if DEBUG

import UIKit
import SwiftUI

extension IBPreview {
    
    public func toto() { }

    @available(iOS 13.0, *)
    public struct FreeFormView: UIViewControllerRepresentable {

        private let viewMaker: (Context) -> UIView

        public init(_ view: UIView) {
            self.viewMaker = { _ in
                view
            }
        }

        public init(viewMaker: @escaping (Context) -> UIView) {
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
}

#endif
