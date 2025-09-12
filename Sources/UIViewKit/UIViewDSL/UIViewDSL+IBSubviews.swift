//
//  UIViewDSL+Subviews.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

extension UIViewDSL {

    @discardableResult
    public func ibSubviews(@IBArrayOfUIViewBuilder _ content: () -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }

    @discardableResult
    public func ibSubviews(@IBArrayOfUIViewBuilder _ content: (Self) -> [UIView]) -> Self {
        let contentWrapper: (UIView) -> [UIView] = { arg1 in
            content(arg1 as! Self) // swiftlint:disable:this force_cast
        }
        UIViewDSLEngine.shared.addSubviews(contentWrapper, to: self)
        return self
    }
}
