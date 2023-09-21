//
//  VerticalStackTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest
@testable import UIViewKit

class VerticalStackTests: XCTestCase {
    
    typealias SUT = VerticalStack
    
    func testInit() throws {
        let sut = SUT()
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.spacing, 0)
        XCTAssertEqual(sut.alignment, .fill)
        XCTAssertEqual(sut.distribution, .fill)
    }
    
    func testInitWithArguments() throws {
        let sut = SUT(spacing: 1, alignment: .center, distribution: .fillEqually)
        XCTAssertNotNil(sut.axis)
        XCTAssertEqual(sut.spacing, 1)
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.alignment, .center)
        XCTAssertEqual(sut.distribution, .fillEqually)
    }
}
