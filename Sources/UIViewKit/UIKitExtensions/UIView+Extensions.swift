//
//  UIView+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/02/2024.
//

import UIKit

extension UIView {
    
    public final func ibConstraints(to: UILayoutGuide, anchors: IBConstraints.ViewAnchor...) -> [NSLayoutConstraint] {
        IBConstraints.createConstraints(from: self, to: to, anchors: anchors)
    }

    public final func ibConstraints(to: UIView, anchors: IBConstraints.ViewAnchor...) -> [NSLayoutConstraint] {
        IBConstraints.createConstraints(from: self, to: to, anchors: anchors)
    }
}
