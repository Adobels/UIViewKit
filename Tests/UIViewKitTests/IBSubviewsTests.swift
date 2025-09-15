//
//  IBSubviewsTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 17/09/2023.
//

import XCTest

@MainActor
class IBSubviewsTests: XCTestCase {

    func testIBSubviewsView() throws {
        _ = UIView().ibSubviews {
            UILabel()
        }
    }

    func testIBSubviewsViewAsSuperview() throws {
        _ = UIView().ibSubviews { _ in
            UILabel()
        }
    }

    func testIBSubviewsStackView() throws {
        _ = UIStackView().ibSubviews {
            UILabel()
        }
    }

    func testIBSubviewsStackViewAsSuperview() throws {
        _ = UIStackView().ibSubviews { _ in
            UILabel()
        }
    }

    func testIBSubviewsWithForEach() throws {
        let subviews = [
            UILabel(),
            UIView()
        ]
        _ = UIStackView().ibSubviews {
            subviews.filter { _ =  $0; return true }
        }
    }

    func testForLoop() throws {
        let rootView = UIView().ibSubviews {
            for _ in (0...2) {
                UIView()
            }
        }
        XCTAssertEqual(rootView.subviews.count, 3)
    }
}
