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
    public func ibAttributes(@NSLayoutConstraintBuilder _ block: @escaping (Self) -> [NSLayoutConstraint]) -> Self {
        let wrappedBlock: (AnyObject) -> [NSLayoutConstraint] = { object in
                if let selfObject = object as? Self {
                    return block(selfObject)
                }
                fatalError("this line should not be executed")
            }
        UIViewDSLEngine.shared.addIbAttributes(wrappedBlock, for: self)
        return self
    }
}
