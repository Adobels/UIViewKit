//
//  UIViewDSL+IBOutlet.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

extension UIViewDSL where Self: UIView {

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
}
