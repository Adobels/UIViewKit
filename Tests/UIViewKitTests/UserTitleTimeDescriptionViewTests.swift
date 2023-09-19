//
//  UserTitleTimeDescriptionViewTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 18/09/2023.
//

import XCTest
@testable import UIViewKit

final class CellAmandaClarkeViewTests: XCTestCase {
    
    func testUserTitleTimeDescriptionView() throws {
        let sut = UserTitleTimeDescriptionView()
        XCTAssertNotNil(sut.labelTitle)
        XCTAssertNotNil(sut.labelTime)
        XCTAssertNotNil(sut.labelDescription)
        XCTAssertNotNil(sut.imageViewUser)
    }

}
