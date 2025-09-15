//
//  UIViewDebugShowFramesTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 19/09/2023.
//

import XCTest
@testable import UIViewKit

@MainActor
class UIViewDebugShowFramesTests: XCTestCase {

    typealias SUT = IBDebug

    private var view: HelloWordView!

    func testHelloWordViewIncludeGivenViewTrue() throws {
        view = .init()
        SUT.showFrames(of: view, includeGivenView: true, includeUIKitPrivateViews: false)

        XCTAssertEqual(view.layer.borderWidth, 1)
        XCTAssertEqual(view.subviews.first!.layer.borderWidth, 1)
    }

    func testHelloWordViewIncludeGivenViewFalse() throws {
        view = .init()
        SUT.showFrames(of: view, includeGivenView: false, includeUIKitPrivateViews: false)

        XCTAssertEqual(view.layer.borderWidth, 0)
        XCTAssertEqual(view.subviews.first!.layer.borderWidth, 1)
    }
}
