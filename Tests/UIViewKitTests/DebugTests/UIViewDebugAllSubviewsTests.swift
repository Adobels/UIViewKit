//
//  UIViewDebugTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 19/09/2023.
//

import XCTest
@testable import UIViewKit

class UIViewDebugTests: XCTestCase {

    typealias SUT = IBDebug

    func testShow() throws {
        let view = HelloWordView()
        let result = SUT.allSubviews(of: view)
        XCTAssertEqual(result.count, 1)
    }

    func testUserTitleTimeDescriptionView() throws {
        let view = UserTitleTimeDescriptionView()
        let result = SUT.allSubviews(of: view)
        XCTAssertEqual(result.count, 12)
    }

    func testUITextField() throws {
        let view = UITextField()
        let result = SUT.allSubviews(of: view, includeUIKitPrivateViews: false)
        XCTAssertEqual(result.count, 0)
    }

    func testUITextFieldIncludeUIKitPrivateViews() throws {
        let view = UITextField()
        let result = SUT.allSubviews(of: view, includeUIKitPrivateViews: true)
        XCTAssertEqual(result.count, 1)
    }

    func testPrivateViewsForNestedTextFieldInOtherTextField() throws {
        let view = UITextField()
        view.addSubview(UITextField())
        let result = SUT.allSubviews(of: view, includeUIKitPrivateViews: true)
        XCTAssertEqual(result.count, 3)
    }

    func testPublicViewsForNestedTextFieldInOtherTextField() throws {
        let view = UITextField()
        view.addSubview(UITextField())
        let result = SUT.allSubviews(of: view, includeUIKitPrivateViews: false)
        XCTAssertEqual(result.count, 1)
    }

}
