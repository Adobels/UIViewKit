//
//  NSObject+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import Foundation

public protocol NSObjectExtensions {}; extension NSObject: NSObjectExtensions { }

extension NSObjectExtensions {
    
    @discardableResult
    public func ibApply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
