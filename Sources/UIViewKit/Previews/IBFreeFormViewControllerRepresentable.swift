//
//  IBFreeFormViewControllerRepresentable.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 13/11/2023.
//

#if DEBUG

import UIKit
import SwiftUI

public struct IBFreeFormViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    private let makeUIViewController: () -> ViewController

    init(_ maker: @autoclosure @escaping () -> ViewController) {
        makeUIViewController = maker
    }
    
    init(_ maker: @escaping () -> ViewController) {
        makeUIViewController = maker
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        let containerVC = ContainerViewController()
        containerVC.childViewController = makeUIViewController()
        return containerVC
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }

}

private class ContainerViewController: UIViewController {

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

#endif
