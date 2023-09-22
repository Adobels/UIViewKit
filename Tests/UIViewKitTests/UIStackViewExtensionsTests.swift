//
//  UIStackViewExtensionsTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 22/09/2023.
//

import XCTest
@testable import UIViewKit

class UIStackViewExtensions: XCTestCase {
    
    typealias SUT = UIStackView
    
    func testVertical() throws {
        let sut = SUT(axis: .vertical)
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.spacing, 0)
        XCTAssertEqual(sut.alignment, .fill)
        XCTAssertEqual(sut.distribution, .fill)
    }
    
    func testVerticalWithArguments() throws {
        let sut = SUT(axis: .vertical, spacing: 1, alignment: .top, distribution: .equalCentering)
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.spacing, 1)
        XCTAssertEqual(sut.alignment, .top)
        XCTAssertEqual(sut.distribution, .equalCentering)
    }
    
    func testHorizontal() throws {
        let sut = SUT(axis: .horizontal)
        XCTAssertEqual(sut.axis, .horizontal)
        XCTAssertEqual(sut.spacing, 0)
        XCTAssertEqual(sut.alignment, .fill)
        XCTAssertEqual(sut.distribution, .fill)
    }
    
    func testHorizontalWithArguments() throws {
        let sut = SUT(axis: .horizontal, spacing: 1, alignment: .top, distribution: .equalCentering)
        XCTAssertEqual(sut.axis, .horizontal)
        XCTAssertEqual(sut.spacing, 1)
        XCTAssertEqual(sut.alignment, .top)
        XCTAssertEqual(sut.distribution, .equalCentering)
    }
}
