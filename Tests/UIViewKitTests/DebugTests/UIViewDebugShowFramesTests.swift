//
//  UIViewDebugShowFramesTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 19/09/2023.
//

import XCTest
@testable import UIViewKit
@testable import UIViewKitDevelopmentViews

class UIViewDebugShowFramesTests: XCTestCase {

    typealias SUT = UIViewDebug

    private var view: HelloWordView!

    override func setUp() {
        super.setUp()
        view = .init()
    }

    func testHelloWordViewIncludeGivenViewTrue() throws {
        SUT.showFrames(of: view, includeGivenView: true, includeUIKitPrivateViews: false)

        XCTAssertEqual(view.layer.borderWidth, 1)
        XCTAssertEqual(view.subviews.first!.layer.borderWidth, 1)
    }

    func testHelloWordViewIncludeGivenViewFalse() throws {
        SUT.showFrames(of: view, includeGivenView: false, includeUIKitPrivateViews: false)

        XCTAssertEqual(view.layer.borderWidth, 0)
        XCTAssertEqual(view.subviews.first!.layer.borderWidth, 1)
    }
}
