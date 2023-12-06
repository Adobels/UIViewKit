//
//  UIViewDSL+NSLayoutConstraint.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 06/12/2023.
//

import UIKit

extension NSLayoutConstraint {

    static public func ibActivate(@IBLayoutConstraintBuilder _ block: () -> [NSLayoutConstraint]) {
        let constraints = block()
        constraints.forEach { $0.identifier = UIViewKitLayoutConstraintIdentifier.ibActivate }
        activate(constraints)
    }

    @discardableResult
    public func ibIdentifier(_ identifier: String) -> Self {
        self.identifier = identifier
        return self
    }
    
    @discardableResult
    public func ibPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }

    @discardableResult
    public func ibOutlet(_ outlet: inout NSLayoutConstraint?) -> Self {
        outlet = self
        return self
    }

    @discardableResult
    public func ibOutlet(_ outlet: inout NSLayoutConstraint) -> Self {
        outlet = self
        return self
    }
}
