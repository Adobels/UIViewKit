//
//  ibConstraintsTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 22/09/2023.
//

import XCTest
@testable import UIViewKit

@MainActor
class ibConstraintsTests: XCTestCase {

    // swiftlint:disable:next function_body_length
    func testViewAll() throws {
        let view = UIView()
        let subview = UIView()

        view {
            subview.ibAttributes {
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .all)
            }
        }

        XCTAssertEqual(view.constraints.count, 4)
        XCTAssertEqual(subview.constraints.count, 0)

        let firstConstraint = try XCTUnwrap(view.constraints[0])
        let secondConstraint = try XCTUnwrap(view.constraints[1])
        let thirdConstraint = try XCTUnwrap(view.constraints[2])
        let fourthConstraint = try XCTUnwrap(view.constraints[3])

        try {
            let firstConstraintFirstItem = try XCTUnwrap(firstConstraint.firstItem as? UIView)
            let secondConstraintFirstItem = try XCTUnwrap(secondConstraint.firstItem as? UIView)
            let thirdConstraintFirstItem = try XCTUnwrap(thirdConstraint.firstItem as? UIView)
            let fourthConstraintFirstItem = try XCTUnwrap(fourthConstraint.firstItem as? UIView)

            XCTAssertEqual(firstConstraintFirstItem, subview)
            XCTAssertEqual(secondConstraintFirstItem, subview)
            XCTAssertEqual(thirdConstraintFirstItem, subview)
            XCTAssertEqual(fourthConstraintFirstItem, subview)
        }()

        try {
            let firstConstraintSecondItem = try XCTUnwrap(firstConstraint.secondItem as? UIView)
            let secondConstraintSecondItem = try XCTUnwrap(secondConstraint.secondItem as? UIView)
            let thirdConstraintSecondItem = try XCTUnwrap(thirdConstraint.secondItem as? UIView)
            let fourthConstraintSecondItem = try XCTUnwrap(fourthConstraint.secondItem as? UIView)

            XCTAssertEqual(firstConstraintSecondItem, view)
            XCTAssertEqual(secondConstraintSecondItem, view)
            XCTAssertEqual(thirdConstraintSecondItem, view)
            XCTAssertEqual(fourthConstraintSecondItem, view)
        }()

        try {
            let firstConstraintFirstAttribute = try XCTUnwrap(firstConstraint.firstAttribute)
            let secondConstraintFirstAttribute = try XCTUnwrap(secondConstraint.firstAttribute)
            let thirdConstraintFirstAttribute = try XCTUnwrap(thirdConstraint.firstAttribute)
            let fourthConstraintFirstAttribute = try XCTUnwrap(fourthConstraint.firstAttribute)

            XCTAssertEqual(firstConstraintFirstAttribute.rawValue, 3)
            XCTAssertEqual(secondConstraintFirstAttribute.rawValue, 4)
            XCTAssertEqual(thirdConstraintFirstAttribute.rawValue, 1)
            XCTAssertEqual(fourthConstraintFirstAttribute.rawValue, 2)
        }()

        try {
            let firstConstraintSecondAttribute = try XCTUnwrap(firstConstraint.secondAttribute)
            let secondConstraintSecondAttribute = try XCTUnwrap(secondConstraint.secondAttribute)
            let thirdConstraintSecondAttribute = try XCTUnwrap(thirdConstraint.secondAttribute)
            let fourthConstraintSecondAttribute = try XCTUnwrap(fourthConstraint.secondAttribute)

            XCTAssertEqual(firstConstraintSecondAttribute.rawValue, 3)
            XCTAssertEqual(secondConstraintSecondAttribute.rawValue, 4)
            XCTAssertEqual(thirdConstraintSecondAttribute.rawValue, 1)
            XCTAssertEqual(fourthConstraintSecondAttribute.rawValue, 2)
        }()

        try {
            let firstConstraintSecondAnchor = try XCTUnwrap(firstConstraint.secondAnchor)
            let secondConstraintSecondAnchor = try XCTUnwrap(secondConstraint.secondAnchor)
            let thirdConstraintSecondAnchor = try XCTUnwrap(thirdConstraint.secondAnchor)
            let fourthConstraintSecondAnchor = try XCTUnwrap(fourthConstraint.secondAnchor)

            XCTAssertEqual(firstConstraintSecondAnchor, view.topAnchor)
            XCTAssertEqual(secondConstraintSecondAnchor, view.bottomAnchor)
            XCTAssertEqual(thirdConstraintSecondAnchor, view.leftAnchor)
            XCTAssertEqual(fourthConstraintSecondAnchor, view.rightAnchor)
        }()

        try {
            let firstConstraintSecondAnchor = try XCTUnwrap(firstConstraint.secondAnchor)
            let secondConstraintSecondAnchor = try XCTUnwrap(secondConstraint.secondAnchor)
            let thirdConstraintSecondAnchor = try XCTUnwrap(thirdConstraint.secondAnchor)
            let fourthConstraintSecondAnchor = try XCTUnwrap(fourthConstraint.secondAnchor)

            XCTAssertEqual(firstConstraintSecondAnchor, view.topAnchor)
            XCTAssertEqual(secondConstraintSecondAnchor, view.bottomAnchor)
            XCTAssertEqual(thirdConstraintSecondAnchor, view.leftAnchor)
            XCTAssertEqual(fourthConstraintSecondAnchor, view.rightAnchor)
        }()
    }

    func testRunDifferentConfigurations() throws {
        let view = UIView()
        let subview = UIView()

        view {
            subview.ibAttributes {
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .all)
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .top, .left, .right, .bottom)
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .top(1), .left(1), .right(-1), .bottom(-1))
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .top, .leading, .trailing, .bottom)
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .top(1), .leading(1), .trailing(-1), .bottom(-1))
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .centerX, .centerY)
                IBConstraints.createConstraints(from: $0, to: view, guide: .view, anchors: .centerX(1), .centerY(1))
                IBConstraints.createConstraints(from: $0, to: view, guide: .viewMargins, anchors: .all)
                IBConstraints.createConstraints(from: $0, to: view, guide: .viewSafeArea, anchors: .all)
            }
        }

        XCTAssertEqual(view.constraints.count, 40)
    }
}
