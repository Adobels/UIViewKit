//
//  File.swift
//  
//
//  Created by MaxAir on 20/09/2023.
//

import Foundation

public protocol NSObjectExtensions {}; extension NSObject: NSObjectExtensions { }

extension NSObjectExtensions {
    
    @discardableResult
    func apply(_ block: (Self) -> Void) -> Self{
        block(self)
        return self
    }
}
