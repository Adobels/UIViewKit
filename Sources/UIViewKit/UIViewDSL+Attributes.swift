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
    public func ibAttributes(@NSLayoutConstraintBuilder _ block: (Self) -> [NSLayoutConstraint]) -> Self {
        let constraintsGenerated = block(self)
        #if DEBUG
        UIViewDSLEngine.shared.constraintsToApplyForDebug.forEach {
            if $0.0 == self {
                fatalError(Thread.callStackSymbols.debugDescription)
            }
        }
        #endif
        UIViewDSLEngine.shared.addConstraints(for: self, constraints: constraintsGenerated)
        return self
    }
}
