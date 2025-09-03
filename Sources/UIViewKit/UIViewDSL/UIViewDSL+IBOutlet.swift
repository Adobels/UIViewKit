//
//  UIViewDSL+IBOutlet.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

extension UIViewDSL {

    @discardableResult
    public func ibOutlet(_ outlet: inout Self?) -> Self {
        outlet = self
        return self
    }

    @discardableResult
    public func ibOutlet(_ outlet: inout Self) -> Self {
        outlet = self
        return self
    }

    @discardableResult
    public func ibOutlet(in outlet: inout [Self]) -> Self {
        outlet.append(self)
        return self
    }

    @discardableResult
    public func ibOutlets(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
    @discardableResult
    public func ibOutlet<Owner: AnyObject>(_ owner: Owner?, _ property: ReferenceWritableKeyPath<Owner, Self>) -> Self {
        owner?[keyPath: property] = self
        return self
    }
    
    @discardableResult
    public func ibOutlet<Owner: AnyObject>(_ owner: Owner?, _ property: ReferenceWritableKeyPath<Owner, Self?>) -> Self {
        owner?[keyPath: property] = self
        return self
    }
    
}
