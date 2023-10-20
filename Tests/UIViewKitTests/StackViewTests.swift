//
//  StackViewTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest
@testable import UIViewKit

class StackViewTests: XCTestCase {
    
    typealias SUT = UIStackView
    
    func testHorizontalStackView() throws {
        let sut = SUT(axis: .horizontal, spacing: 1, alignment: .center, distribution: .fillEqually)
        XCTAssertNotNil(sut.axis)
        XCTAssertEqual(sut.spacing, 1)
        XCTAssertEqual(sut.axis, .horizontal)
        XCTAssertEqual(sut.alignment, .center)
        XCTAssertEqual(sut.distribution, .fillEqually)
    }
    
    func testVerticalStackView() throws {
        let sut = SUT(axis: .vertical, spacing: 1, alignment: .center, distribution: .fillEqually)
        XCTAssertNotNil(sut.axis)
        XCTAssertEqual(sut.spacing, 1)
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.alignment, .center)
        XCTAssertEqual(sut.distribution, .fillEqually)
    }
}
