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
    public struct FreeForm<T: UIViewController>: UIViewControllerRepresentable {
        
        public typealias UIViewControllerType = UIViewController
        
        private let viewControllerMaker: () -> T
        
        public init(_ view: UIView) {
            self.viewControllerMaker = {
                let vc = T()
                vc.loadViewIfNeeded()
                vc.view.ibSubviews {
                    view.ibAttributes {
                        $0.ibConstraints(to: vc.view, guide: .view, anchors: .all)
                    }
                }
                return vc
            }
        }
        
        public init(_ viewController: T) {
            self.viewControllerMaker = { viewController }
        }
        public init(_ viewControllerMaker: @escaping () -> T) {
            self.viewControllerMaker = viewControllerMaker
        }
        
        public func makeUIViewController(context: Context) -> UIViewController {
            let controller = viewControllerMaker()
            controller.loadViewIfNeeded()
            let freeFormContainer = ViewControllerFreeFormContainer()
            freeFormContainer.loadViewIfNeeded()
            freeFormContainer.containerView.ibSubviews { superview in
                controller.view.ibAttributes {
                    $0.ibConstraints(to: superview, guide: .view, anchors: .all)
                }
            }
            freeFormContainer.addChild(controller)
            controller.willMove(toParent: freeFormContainer)
            return freeFormContainer
        }
        
        public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    }

    final class ViewControllerFreeFormContainer: UIViewController {
        var containerView: UIView!
        var heightConstraint: NSLayoutConstraint!
        var widthConstraint: NSLayoutConstraint!
        private var iPhoneSE2FrameView: UIView!
        private var iPhoneSE2WithKeyboardFrameView: UIView!
        private var snapToViewFeature: SnapToViewFeature!
        private let iPhoneSE2Frame = CGRect(origin: .zero, size: .init(width: 375, height: 667))
        private let iPhoneSE2WithKeyboardFrame = CGRect(origin: .zero, size: .init(width: 375, height: 451))
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .lightGray
            view.ibSubviews { superview in
                UIView().ibOutlet(&iPhoneSE2FrameView).ibSubviews { superview in
                    UILabel().ibAttributes {
                        $0.ibConstraints(to: superview, guide: .view, anchors: .left, .bottom, .right)
                        $0.text = "iPhone SE2"
                        $0.textAlignment = .center
                        $0.textColor = .cyan
                    }
                }.ibAttributes {
                    $0.topAnchor.constraint(equalTo: superview.topAnchor)
                    $0.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
                    $0.widthAnchor.constraint(equalToConstant: iPhoneSE2Frame.width)
                    $0.heightAnchor.constraint(equalToConstant: iPhoneSE2Frame.height)
                    $0.layer.borderColor = UIColor.cyan.cgColor
                    $0.layer.borderWidth = 2
                }
            }
            view.ibSubviews { superview in
                UIView().ibOutlet(&iPhoneSE2WithKeyboardFrameView).ibSubviews { superview in
                    UILabel().ibAttributes {
                        $0.ibConstraints(to: superview, guide: .view, anchors: .left, .bottom, .right)
                        $0.text = "iPhone SE2 With Keyboard"
                        $0.textAlignment = .center
                        $0.textColor = UIColor.yellow
                    }
                }.ibAttributes {
                    $0.topAnchor.constraint(equalTo: superview.topAnchor)
                    $0.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
                    $0.widthAnchor.constraint(equalToConstant: iPhoneSE2WithKeyboardFrame.width)
                    $0.heightAnchor.constraint(equalToConstant: iPhoneSE2WithKeyboardFrame.height)
                    $0.layer.borderColor = UIColor.yellow.cgColor
                    $0.layer.borderWidth = 2
                }
            }
            view.ibSubviews { superview in
                UIView().ibOutlet(&containerView).ibAttributes {
                    $0.topAnchor.constraint(equalTo: superview.topAnchor)
                    $0.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
                    $0.widthAnchor.constraint(equalToConstant: view.frame.width).ibOutlet(&widthConstraint)
                    $0.heightAnchor.constraint(equalToConstant: view.frame.height).ibOutlet(&heightConstraint)
                }
            }
            snapToViewFeature = .init(
                viewToSnap: [
                    iPhoneSE2WithKeyboardFrameView,
                    iPhoneSE2FrameView,
                    view,
                ],
                containerView: containerView,
                controller: self
            )
            view.addGestureRecognizer(snapToViewFeature.tapGesture())
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            workaroundHideKeyboardAndSizeContainerView()
        }
        
        private func workaroundHideKeyboardAndSizeContainerView() {
            DispatchQueue.main.async {
                UIView.performWithoutAnimation {
                    self.view.endEditing(true)
                }
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            guard let touch = touches.first else { return }
            let loc = touch.location(in: view)
            heightConstraint.constant = loc.y
            widthConstraint.constant = loc.x
        }
    }

    final class SnapToViewFeature {
        
        private let viewToSnap: [UIView]
        private let containerView: UIView
        private let controller: ViewControllerFreeFormContainer
        
        init(viewToSnap: [UIView], containerView: UIView, controller: ViewControllerFreeFormContainer) {
            self.viewToSnap = viewToSnap
            self.containerView = containerView
            self.controller = controller
        }
        
        func tapGesture() -> UIGestureRecognizer {
            UITapGestureRecognizer(target: self, action: #selector(didTap(gesture:)))
        }
        
        @objc
        func didTap(gesture: UIGestureRecognizer) {
            guard let tapGesture = gesture as? UITapGestureRecognizer else { return }
            for viewToSnap in self.viewToSnap {
                let loc = tapGesture.location(in: viewToSnap)
                if viewToSnap.frame.contains(loc) {
                    controller.widthConstraint.constant = viewToSnap.frame.width
                    controller.heightConstraint.constant = viewToSnap.frame.height
                    return
                }
            }
        }
        
    }
}
