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
        _ = UIView().ibSubviews {
            UIView()
        }
    }

    func testComplexSubview() throws {
        let alwaysTrue = true
        let alwaysFalse = false
        let view = UIView().ibSubviews {
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
            UIView().ibSubviews {
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
