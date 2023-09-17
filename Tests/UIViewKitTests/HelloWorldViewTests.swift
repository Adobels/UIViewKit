//
//  HelloWorldViewTests.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import XCTest
@testable import UIViewKit

final class HelloWorldViewTests: XCTestCase {
    
    func testLabelText() throws {
        let sut = HelloWordView()
        let label = try XCTUnwrap(sut.subviews.first! as? UILabel)
        XCTAssertEqual(label.text, "Hello, world!")
    }

}
