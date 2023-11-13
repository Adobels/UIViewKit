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

}
