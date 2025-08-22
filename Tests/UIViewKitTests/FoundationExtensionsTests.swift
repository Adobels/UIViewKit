//
//  FoundationExtensionsTests.swift
//  UIViewKit
//
//  Created by blz on 22/08/2025.
//

import Testing
import Foundation

@Test func ibApply() throws {
    let newValue = "test"
    let obj = NSObject()
    try #require(obj.accessibilityLabel == nil)
    _ = obj.ibApply {
        $0.accessibilityLabel = newValue
    }
    #expect(obj.accessibilityLabel == newValue)
}

