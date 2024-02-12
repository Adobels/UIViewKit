//
//  UIView+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/02/2024.
//

import UIKit

extension UIView {
    
    final func ibConstraints(to: UIView, guide: IBConstraints.LayoutGuide, anchors: IBConstraints.ViewAnchor...) -> [NSLayoutConstraint] {
        IBConstraints.createConstraints(from: self, to: to, guide: guide, anchors: anchors)
    }
}
