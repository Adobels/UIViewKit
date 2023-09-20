//
//  HorizontalStackTests.swift
//
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest
@testable import UIViewKit

class HorizontalStackTests: XCTestCase {
    
    func testInit() throws {
        XCTAssertNotNil(HorizontalStack())
    }
    
    func testInitConvenienceInit() throws {
        let sut = HorizontalStack(spacing: 1, alignment: .center, distribution: .fillEqually)
        XCTAssertNotNil(sut.axis)
        XCTAssertEqual(sut.axis, .horizontal)
        XCTAssertEqual(sut.alignment, .center)
        XCTAssertEqual(sut.distribution, .fillEqually)
    }
}
