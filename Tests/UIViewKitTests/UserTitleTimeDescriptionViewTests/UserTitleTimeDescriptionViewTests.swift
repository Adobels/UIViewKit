//
//  UserTitleTimeDescriptionViewTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 18/09/2023.
//

import XCTest
@testable import UIViewKit

class UserTitleTimeDescriptionViewTests: XCTestCase {

    func testUserTitleTimeDescriptionView() throws {
        let sut = UserTitleTimeDescriptionView()
        XCTAssertNotNil(sut.labelTitle)
        XCTAssertNotNil(sut.labelTime)
        XCTAssertNotNil(sut.labelDescription)
        XCTAssertNotNil(sut.imageViewUser)
    }

    func testUserTitleTimeDescriptionViewWithIBSubviewsWithSuperviewView() throws {
        let sut = UserTitleTimeDescriptionViewWithIBSubviewsWithSuperviewView()
        XCTAssertNotNil(sut.labelTitle)
        XCTAssertNotNil(sut.labelTime)
        XCTAssertNotNil(sut.labelDescription)
        XCTAssertNotNil(sut.imageViewUser)
    }

    func testUserTitleTimeDescriptionViewWithIBSubviews() throws {
        let sut = UserTitleTimeDescriptionViewWithIBSubviews()
        XCTAssertNotNil(sut.labelTitle)
        XCTAssertNotNil(sut.labelTime)
        XCTAssertNotNil(sut.labelDescription)
        XCTAssertNotNil(sut.imageViewUser)
    }
}
