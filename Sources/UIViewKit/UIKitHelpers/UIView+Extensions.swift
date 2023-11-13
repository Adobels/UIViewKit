//
//  UIView+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 13/11/2023.
//

import UIKit

extension UIViewDSL where Self: UIView {

    @discardableResult
    public func ibSetAsRootView(of controller: UIViewController) -> Self {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        frame = controller.view.frame
        layoutIfNeeded()
        controller.view = self
        return self
    }
}
