//
//  UIViewDSLTests.swift
//  UIViewDSL
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import XCTest
@testable import UIViewDSL

final class UIViewDSLTests: XCTestCase {

    func testHelloWorldView() throws {
        let sut = HelloWordView()
        let label = try XCTUnwrap(sut.subviews.first! as? UILabel)
        XCTAssertEqual(label.text, "Hello, world!")
    }

}
