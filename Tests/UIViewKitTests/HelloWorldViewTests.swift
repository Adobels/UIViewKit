//
//  HelloWorldViewTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import XCTest
import UIKit
@testable import UIViewKit
@testable import UIViewKitDevelopmentViews
import SnapshotTesting

class HelloWorldViewTests: XCTestCase {
    typealias SUT = HelloWordView

    func testLabelText() throws {
        let sut = SUT()
        let label = try XCTUnwrap(sut.subviews.first! as? UILabel)
        XCTAssertEqual(label.superview, sut)
        XCTAssertEqual(sut.constraints.count, 2)
    }
    
    func testSnapshotHierarchy() {
        let sut = SUT()
        sut.frame = .init(origin: .zero, size: .init(width: 320, height: 548))
        assertSnapshot(of: sut, as: .recursiveDescription)
    }
    func testSnapshotUI() {
        let sut = SUT()
        sut.frame = .init(origin: .zero, size: .init(width: 320, height: 548))
        assertSnapshot(of: sut, as: .image)
    }
}
