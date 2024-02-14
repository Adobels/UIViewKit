//
//  HelloWorldViewTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import XCTest
import UIKit
@testable import UIViewKit

class HelloWorldViewTests: XCTestCase {
    typealias SUT = HelloWordView

    func testLabelText() throws {
        let sut = SUT()
        let label = try XCTUnwrap(sut.subviews.first! as? UILabel)
        XCTAssertEqual(label.superview, sut)
        XCTAssertEqual(sut.constraints.count, 2)
    }
}
