//
//  NSObjectProtocol+ibApply.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 22/08/2025.
//

import Foundation

extension NSObjectProtocol {

    public func ibApply(_ block: (Self) -> Void) -> Self {
        // There is another ibApply defined in a UIView extension.
        // The compiler will choose the correct one.
        // This check is just to remind me about the other apply.
        assert((self as? UIView) == nil)
        block(self)
        return self
    }

}
