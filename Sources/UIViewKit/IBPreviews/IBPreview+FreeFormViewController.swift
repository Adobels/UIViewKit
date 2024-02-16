//
//  IBPreview+FreeFormViewController.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 13/11/2023.
//

import UIKit
import SwiftUI

extension IBPreview {

    @available(iOS 13.0, *)
    public struct FreeFormViewController: UIViewControllerRepresentable {

        private let makeUIViewController: () -> UIViewController

        public init(_ maker: @autoclosure @escaping () -> UIViewController) {
            makeUIViewController = maker
        }

        public init(_ maker: @escaping () -> UIViewController) {
            makeUIViewController = maker
        }

        public func makeUIViewController(context: Context) -> UIViewController {
            let containerVC = ContainerViewController()
            containerVC.childViewController = makeUIViewController()
            return containerVC
        }

        public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    }
}

extension IBPreview {

    final class ContainerViewController: UIViewController {

        var childViewController: UIViewController? {
            didSet {
                setupChildViewController()
            }
        }

        private func setupChildViewController() {
            guard let childVC = childViewController else { return }

            addChild(childVC)
            view.addSubview(childVC.view)

            childVC.view.frame = .init(origin: .zero, size: view.frame.size)

            childVC.didMove(toParent: self)

            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
            view.addGestureRecognizer(panGesture)
        }

        @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
            let translation = gesture.translation(in: view)
            if let childView = childViewController?.view {
                let newWidth = max(20, childView.frame.width + translation.x)
                let newHeight = max(20, childView.frame.height + translation.y)
                childView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
            gesture.setTranslation(.zero, in: view)
        }
    }
}
