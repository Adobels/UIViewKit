//
//  UIViewDSL+Attributes.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

extension UIViewDSL where Self: UIView {

    @MainActor
    @discardableResult
    public func ibAttributes(@NSLayoutConstraintBuilder _ block: (Self) -> [NSLayoutConstraint]) -> Self {
        let constraintsGenerated = block(self)
        UIViewDSLEngine.shared.addConstraints(for: self, constraints: constraintsGenerated)
        return self
    }
}
