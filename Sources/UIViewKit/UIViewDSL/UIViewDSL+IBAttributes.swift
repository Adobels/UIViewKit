//
//  UIViewDSL+Attributes.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

extension UIViewDSL {

    @discardableResult
    public func ibAttributes(@IBArrayOfNSLayoutConstraintBuilder _ block: (Self) -> [NSLayoutConstraint]) -> Self {
        let constraintsGenerated = block(self)
        UIViewDSLEngine.shared.addConstraints(for: self, constraints: constraintsGenerated)
        return self
    }
}
