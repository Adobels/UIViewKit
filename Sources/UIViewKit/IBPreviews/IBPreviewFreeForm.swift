//
//  IBPreviewFreeForm.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 13/11/2023.
//

import UIKit
import SwiftUI

public class IBPreviewFreeForm: ViewControllerFreeFormContainer {

    private var viewControllerMaker: (() -> UIViewController)?
    private var viewMaker: (() -> UIView)?

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public init(snapFrames: (any SnapFrame)..., view: UIView) {
        super.init(snapFrames: snapFrames)
        self.viewMaker = { view }
    }

    public init(view: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.viewMaker = { view }
    }

    public init(snapFrames: (any SnapFrame)..., viewMaker: @escaping () -> UIView) {
        super.init(snapFrames: snapFrames)
        self.viewMaker = viewMaker
    }

    public init(_ viewMaker: @escaping () -> UIView) {
        super.init(nibName: nil, bundle: nil)
        self.viewMaker = viewMaker
    }

    public init(snapFrames: (any SnapFrame)..., viewController: UIViewController) {
        super.init(snapFrames: snapFrames)
        self.viewControllerMaker = { viewController }
    }

    public init(viewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerMaker = { viewController }
    }

    public init(snapFrames: (any SnapFrame)..., viewControllerMaker: @escaping () -> UIViewController) {
        super.init(snapFrames: snapFrames)
        self.viewControllerMaker = viewControllerMaker
    }

    public init(_ viewControllerMaker: @escaping () -> UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerMaker = viewControllerMaker
    }

    public init(snapFrames: (any SnapFrame)..., view: some View) {
        super.init(snapFrames: snapFrames)
        self.viewControllerMaker = { UIHostingController(rootView: view) }
    }

    public init(view: some View) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerMaker = { UIHostingController(rootView: view) }
    }

    public init(snapFrames: (any SnapFrame)..., viewMaker: @escaping () -> some View) {
        super.init(snapFrames: snapFrames )
        self.viewControllerMaker = { UIHostingController(rootView: viewMaker()) }
    }

    public init(_ viewMaker: @escaping () -> some View) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerMaker = { UIHostingController(rootView: viewMaker()) }
    }

    public override func loadView() {
        super.loadView()
        if let viewMaker = viewMaker {
            let viewToPreview = viewMaker()
            containerView.ibSubviews { superview in
                viewToPreview.ibAttributes {
                    $0.ibConstraints(to: superview, guide: .view, anchors: .all)
                }
            }
            return
        } else if let viewControllerMaker = viewControllerMaker {
            let controller = viewControllerMaker()
            controller.loadViewIfNeeded()
            addChild(controller)
            containerView.ibSubviews { superview in
                controller.view.ibAttributes {
                    $0.ibConstraints(to: superview, guide: .view, anchors: .all)
                }
            }
            controller.didMove(toParent: self)
        } else {
            fatalError()
        }
    }

}

extension IBPreviewFreeForm {

    public protocol SnapFrame where Self: SnapFrame {
        var size:  CGSize { get }
        var title: String { get }
        var tintColor: UIColor { get }
        var borderWidth: CGFloat { get }
    }

}

public class ViewControllerFreeFormContainer: UIViewController {

    var containerView: UIView!
    var heightConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    private var snapFrames: [IBPreviewFreeForm.SnapFrame] = []
    private var snapFrameViews: [UIView] = []
    private var snapToViewFeature: SnapToViewFeature!

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    init(snapFrames: [IBPreviewFreeForm.SnapFrame]) {
        self.snapFrames = snapFrames
        super.init(nibName: nil, bundle: nil)
    }

    public override func loadView() {
        super.loadView()
        view.backgroundColor = .lightGray
        snapFrames.forEach { snapFrame in
            view.ibSubviews {
                UIView().ibSubviews { labelSuperview in
                    UILabel().ibAttributes {
                        $0.ibConstraints(to: labelSuperview, guide: .view, anchors: .left, .bottom, .right)
                        $0.text = snapFrame.title
                        $0.textAlignment = .center
                        $0.textColor = snapFrame.tintColor
                    }
                }.ibAttributes {
                    $0.topAnchor.constraint(equalTo: view.topAnchor)
                    $0.leadingAnchor.constraint(equalTo: view.leadingAnchor)
                    $0.widthAnchor.constraint(equalToConstant: snapFrame.size.width)
                    $0.heightAnchor.constraint(equalToConstant: snapFrame.size.height)
                    $0.layer.borderColor = snapFrame.tintColor.cgColor
                    $0.layer.borderWidth = snapFrame.borderWidth
                    snapFrameViews.append($0)
                }
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
            viewToSnap: snapFrameViews + [view],
            containerView: containerView,
            controller: self
        )
        view.addGestureRecognizer(snapToViewFeature.tapGesture())
    }

    public override func viewDidAppear(_ animated: Bool) {
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

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let loc = touch.location(in: view)
        heightConstraint.constant = loc.y
        widthConstraint.constant = loc.x
    }
}

final private class SnapToViewFeature {

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
    private func didTap(gesture: UIGestureRecognizer) {
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
