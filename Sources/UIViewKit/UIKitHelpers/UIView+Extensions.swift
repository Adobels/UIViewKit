//
//  UIView+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/02/2024.
//

import UIKit

extension UIView {
    
    final func ibCreateConstraints(to: UIView, guide: IBConstraints.LayoutGuide, anchors: IBConstraints.ViewAnchor...) -> [NSLayoutConstraint] {
        IBConstraints.createConstraintsInternal(from: self, to: to, guide: guide, anchors: anchors)
    }
}
