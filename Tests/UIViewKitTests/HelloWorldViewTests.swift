//
//  HelloWorldViewTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import XCTest
@testable import UIViewKit
@testable import UIViewKitPreviewsDemo

class HelloWorldViewTests: XCTestCase {
    typealias SUT = HelloWordView
    
    func testLabelText() throws {
        let sut = SUT()
        
        let label = try XCTUnwrap(sut.subviews.first! as? UILabel)
        XCTAssertEqual(label.text, "Hello, world!")
    }

}
