//
//  VerticalStackTests.swift
//
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest
@testable import UIViewKit

class VerticalStackTests: XCTestCase {
        
    func testInit() throws {
        XCTAssertNotNil(VerticalStack())
    }
    
    func testInitConvenienceInit() throws {
        let sut = VerticalStack(spacing: 1, alignment: .center, distribution: .fillEqually)
        XCTAssertNotNil(sut.axis)
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.alignment, .center)
        XCTAssertEqual(sut.distribution, .fillEqually)
    }
}
