//
//  UIViewDSL+Attributes.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

@MainActor
extension UIViewDSL where Self: UIView {

    @discardableResult
    public func ibAttributes(@IBLayoutConstraintBuilder _ block: (Self) -> [NSLayoutConstraint]) -> Self {
        let constraintsGenerated = block(self)
        constraintsGenerated.forEach { $0.identifier = NSLayoutConstraintIdentifier.ibAttributes.rawValue }
        UIViewDSLEngine.shared.addConstraints(for: self, constraints: constraintsGenerated)
        return self
    }
}

enum NSLayoutConstraintIdentifier: String {
    case ibAttributes = "UIViewKit(ibAttributes)"
    case ibActivate = "UIViewKit(ibActivate)"
    case ibActivateConstraints = "UIViewKit(ibActivateConstraints)"
}
