//
//  IBSubviewsTests.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 17/09/2023.
//

import XCTest

@MainActor
class IBSubviewsTests: XCTestCase {
    
    func testIBSubviews() throws {
        _ = UIView() {
            UILabel()
        }
    }

    func testIBSubviewsView() throws {
        _ = UIView() {
            UILabel()
        }
        _ = UIView().callAsFunction {
            UILabel()
        }
        _ = UIView().ibSubviews {
            UILabel()
        }
    }
    
    func testIBSubviewsViewAsSuperview() throws {
        _ = UIView() { _ in
            UILabel()
        }
        _ = UIView().callAsFunction { _ in
            UILabel()
        }
        _ = UIView().ibSubviews { _ in
            UILabel()
        }
    }
    
    func testIBSubviewsStackView() throws {
        _ = UIStackView() {
            UILabel()
        }
        _ = UIStackView().callAsFunction {
            UILabel()
        }
        _ = UIStackView().ibSubviews {
            UILabel()
        }
    }
    
    func testIBSubviewsStackViewAsSuperview() throws {
        _ = UIStackView() { _ in
            UILabel()
        }
        _ = UIStackView().callAsFunction { _ in
            UILabel()
        }
        _ = UIStackView().ibSubviews { _ in
            UILabel()
        }
    }

}
