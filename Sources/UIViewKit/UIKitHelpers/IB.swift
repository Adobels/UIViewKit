//
//  IB.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 21/11/2023.
//

import UIKit

public func ibConstraints(from: UIView, to: UIView, guide: LayoutGuide, anchors: ViewAnchor...) -> [NSLayoutConstraint] {
    generateConstraints(from: from, to: to, guide: guide, anchors: anchors)
}
