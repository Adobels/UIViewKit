//
//  UIViewController+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 13/11/2023.
//

import UIKit

extension UIViewController {

    public func ibAdd(child: UIViewController, to containerView: UIView) {
        child.view.frame = .init(origin: .zero, size: view.frame.size)
        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
    }

    /**
     Removes a specified child view controller from its parent view controller.

     This method ensures that the view controller hierarchy is updated correctly when a child view controller is removed, maintaining the integrity of the view controller lifecycle which is described [here](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html#//apple_ref/doc/uid/TP40007457-CH11-SW1)

     - Parameters:
        - child: The `UIViewController` instance to be removed from its parent view controller.

     - Important: This method assumes that the `child` view controller is already added to a parent view controller. Calling this method on a view controller that is not a child of any parent will not have any effect.
    */
    public func ibRemove(child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

    /**
     Removes the first subview of a specified container view that is associated with one of the view controller's child view controllers.

     The removal process ensures a safe and clean detachment of the child view controller's view from the view hierarchy which is described [here](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html#//apple_ref/doc/uid/TP40007457-CH11-SW1)

     - Parameters:
        - containerView: The UIView container from which the first subview, if it's a child view controller's view, will be removed.

     - Important: This method does not perform any action if `containerView` does not have any subviews or if the first subview is not a child view controller's view.
    */
    public func ibRemove(from containerView: UIView) {
        guard let childView = containerView.subviews.first else {
            return
        }
        guard let child = children.first(where: { $0.view == childView }) else {
            return
        }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

}
