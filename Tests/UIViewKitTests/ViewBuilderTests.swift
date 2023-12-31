//
//  ViewBuilderTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest
@testable import UIViewKit

@MainActor
class ViewBuilderTests: XCTestCase {

    func testSingleSubview() throws {
        _ = UIView {
            UIView()
        }
    }

    func testComplexSubview() throws {
        let alwaysTrue = true
        let alwaysFalse = false
        let view = UIView {
            UIView()
            print()
            if alwaysTrue {
                UIView()
            }
            if alwaysTrue {
                UIView()
            } else {
                UIView()
            }

            if alwaysFalse {
                UIView()
            } else {
                UIView()
            }
            if Optional.some(true) != nil {
                UIView()
            }
            UIView {
                UIView()
            }
            [UIView(), UIView()]
            #if DEBUG
            UIView()
            #endif
        }
        XCTAssertEqual(view.subviews.count, 9)
    }

}
