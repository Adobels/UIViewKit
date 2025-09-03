//
//  NSObjectProtocol+ibApply.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 22/08/2025.
//

import Foundation

extension NSObjectProtocol {
    
    public func ibApply(_ block: (Self) -> Void) -> Self {
        block(self);
        return self
    }

}
