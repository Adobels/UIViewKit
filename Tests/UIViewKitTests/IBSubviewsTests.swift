//
//  IBSubviewsTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 17/09/2023.
//

import XCTest

class IBSubviewsTests: XCTestCase {

    @MainActor
    func testIBSubviews() throws {
        _ = UIView {
            UILabel()
        }
    }

    @MainActor
    func testIBSubviewsView() throws {
        _ = UIView {
            UILabel()
        }
        _ = UIView().callAsFunction {
            UILabel()
        }
        _ = UIView().ibSubviews {
            UILabel()
        }
    }

    @MainActor
    func testIBSubviewsViewAsSuperview() throws {
        _ = UIView { _ in
            UILabel()
        }
        _ = UIView().callAsFunction { _ in
            UILabel()
        }
        _ = UIView().ibSubviews { _ in
            UILabel()
        }
    }

    @MainActor
    func testIBSubviewsStackView() throws {
        _ = UIStackView {
            UILabel()
        }
        _ = UIStackView().callAsFunction {
            UILabel()
        }
        _ = UIStackView().ibSubviews {
            UILabel()
        }
    }

    @MainActor
    func testIBSubviewsStackViewAsSuperview() throws {
        _ = UIStackView { _ in
            UILabel()
        }
        _ = UIStackView().callAsFunction { _ in
            UILabel()
        }
        _ = UIStackView().ibSubviews { _ in
            UILabel()
        }
    }

    @MainActor
    func testIBSubviewsWithForEach() throws {
        let subviews = [
            UILabel(),
            UIView()
        ]
        _ = UIStackView {
            subviews.filter { _ =  $0; return true }
        }
    }
}
