//
//  UIViewDSL+Subviews.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

@MainActor
extension UIViewDSL where Self: UIView {

    @discardableResult
    public func ibSubviews(@UIViewBuilder _ content: () -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    public func ibSubviews(@UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    public func callAsFunction(@UIViewBuilder _ content: () -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    public func callAsFunction(@UIViewBuilder _ content: (UIView) -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
}
