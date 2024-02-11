//
//  UIViewController+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/02/2024.
//

import UIKit

extension UIViewController {

    @discardableResult
    public final func ibSetView<T: UIView>(with view: T) -> T {
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        view.frame = self.view.frame
        view.layoutIfNeeded()
        self.view = view
        return view
    }

    public final func ibEmbed(_ viewController: UIViewController, _ containerView: UIView) {
        viewController.view.frame = .init(origin: .zero, size: containerView.frame.size)
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    /**
     Remove a specified view controller from its parent view controller and container view

     This method ensures that the view controller hierarchy is updated correctly when a child view controller is removed, maintaining the integrity of the view controller lifecycle which is described [here](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html#//apple_ref/doc/uid/TP40007457-CH11-SW1)

     - Parameters:
     - viewController: The `UIViewController` instance to be removed from its parent view controller and container view

     - Important: This method assumes that the `viewController` view controller is already added to a parent view controller. Calling this method on a view controller that is not a child of any parent will not have any effect.
     */
    public func ibUnembed(_ viewController: UIViewController) {
        guard children.contains(viewController) else { return }
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
