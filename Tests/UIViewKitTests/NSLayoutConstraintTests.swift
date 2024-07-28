//
//  NSLayoutConstraintTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest

class NSLayoutConstraintTests: XCTestCase {

    @MainActor
    func testNSLayoutConstraintActivate() throws {

        var viewFirst: UIView!
        var viewSecond: UIView!
        var view: UIView!

        var constraintTop: NSLayoutConstraint!
        var constraintLeft: NSLayoutConstraint = .init()

        UIView().ibOutlet(&view).ibSubviews { _ in
            UIView().ibOutlet(&viewFirst)
            UIView().ibOutlet(&viewSecond)
        }

        NSLayoutConstraint.ibActivate {
            viewFirst.topAnchor.constraint(equalTo: viewSecond.topAnchor).ibOutlet(&constraintTop).ibPriority(.defaultHigh)
            viewFirst.leftAnchor.constraint(equalTo: viewSecond.leftAnchor).ibOutlet(&constraintLeft).ibPriority(.defaultLow)
            viewFirst.rightAnchor.constraint(equalTo: viewSecond.rightAnchor)
            viewFirst.bottomAnchor.constraint(equalTo: viewSecond.bottomAnchor)
        }
        XCTAssertEqual(view.constraints.count, 4)

        XCTAssertEqual(constraintTop.priority, UILayoutPriority.defaultHigh)
        XCTAssertEqual(constraintLeft.priority, UILayoutPriority.defaultLow)
    }
}
