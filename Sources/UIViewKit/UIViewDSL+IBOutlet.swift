//
//  UIViewDSL+IBOutlet.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

@MainActor
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
    
    @discardableResult
    func ibOutlet(_ outlet: inout Self?, @UIViewBuilder _ content: () -> [UIView]) -> Self {
        outlet = self
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    func ibOutlet(_ outlet: inout Self?, @UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        outlet = self
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    func ibOutlet(_ outlet: inout Self, @UIViewBuilder _ content: () -> [UIView]) -> Self {
        outlet = self
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    func ibOutlet(_ outlet: inout Self, @UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        outlet = self
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    func ibOutlet(in outlet: inout [Self], @UIViewBuilder _ content: () -> [UIView]) -> Self {
        outlet.append(self)
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    func ibOutlet(in outlet: inout [Self], @UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        outlet.append(self)
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
}
