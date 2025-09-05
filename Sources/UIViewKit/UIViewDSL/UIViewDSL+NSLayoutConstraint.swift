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

    @discardableResult
    public func ibOutlet<Owner: Any>(_ owner: Owner?, _ property: ReferenceWritableKeyPath<Owner, NSLayoutConstraint>) -> Self {
        owner?[keyPath: property] = self
        return self
    }

    @discardableResult
    public func ibOutlet<Owner: Any>(_ owner: Owner?, _ property: ReferenceWritableKeyPath<Owner, NSLayoutConstraint?>) -> Self {
        owner?[keyPath: property] = self
        return self
    }

    @discardableResult
    public func ibOutlets(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }

    @discardableResult
    public func ibShouldBeArchived(_ shouldBeArchived: Bool) -> Self {
        self.shouldBeArchived = shouldBeArchived
        return self
    }
}
