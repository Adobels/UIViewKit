//
//  IBOutletTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 17/09/2023.
//

import XCTest

@MainActor
class IBOutletTests: XCTestCase {

    func testIBOutlet() throws {

        var label = UILabel()

        let newLabel = UILabel().ibOutlet(&label)

        XCTAssertEqual(label, newLabel)
    }

    func testIBOutletIn() throws {
        var labels: [UILabel] = []

        let newLabel = UILabel().ibOutlet(in: &labels)

        XCTAssertEqual(labels.count, 1)
        XCTAssertEqual(labels[.zero], newLabel)
    }

    func testIBOutletWithForceUnwrap() throws {
        var label: UILabel!

        let newLabel = UILabel().ibOutlet(&label)

        XCTAssertEqual(label, newLabel)
    }

    func testIBOutletWithTrailingClosureOfIbSubviews() throws {

        var view = UIView()

        let newView = UIView().ibOutlet(&view).ibSubviews {
            UIView()
        }

        XCTAssertEqual(view, newView)
    }

    func testIBOutletWithTrailingClosureOfIbSubviewsAndSuperview() throws {

        var view = UIView()

        let newView = UIView().ibOutlet(&view).ibSubviews { _ in
            UIView()
        }

        XCTAssertEqual(view, newView)
    }

    func testIBOutletInWithTrailingClosureOfIbSubviews() throws {
        var views: [UIView] = []

        let newView = UIView().ibOutlet(in: &views).ibSubviews {
            UIView()
        }

        XCTAssertEqual(views.count, 1)
        XCTAssertEqual(views[.zero], newView)
    }

    func testIBOutletInWithTrailingClosureOfIbSubviewsAndSuperview() throws {
        var views: [UIView] = []

        let newView = UIView().ibOutlet(in: &views).ibSubviews { _ in
            UIView()
        }

        XCTAssertEqual(views.count, 1)
        XCTAssertEqual(views[.zero], newView)
    }

    func testIBOutletWithForceUnwrapWithTrailingClosureOfIbSubviews() throws {
        var view: UIView!

        let newView = UIView().ibOutlet(&view).ibSubviews {
            UIView()
        }

        XCTAssertEqual(view, newView)
    }

    func testIBOutletWithForceUnwrapWithTrailingClosureOfIbSubviewsAndSuperview() throws {
        var view: UIView!

        let newView = UIView().ibOutlet(&view).ibSubviews { _ in
            UIView()
        }

        XCTAssertEqual(view, newView)
    }

    class MyView {
        var label: UILabel!
    }
    class MyViewWithOptionalLabel {
        var label: UILabel?
    }

    func testIBOutletKeyPathWithOptionalOwner() throws {
        let myView: MyView? = .init()
        UILabel().ibOutlet(myView, \.label).ibAttributes { $0.tag = 1 }
        XCTAssertEqual(myView?.label.tag, 1)
    }

    func testIBOutletKeyPathWithOwnerOptionalAndLabelOptional() throws {
        let myView: MyViewWithOptionalLabel? = .init()
        UILabel().ibOutlet(myView, \.label).ibAttributes { $0.tag = 1 }
        XCTAssertEqual(myView?.label?.tag, 1)
    }

    func testIBOutlets() throws {
        let myView: MyViewWithOptionalLabel? = .init()
        UILabel().ibOutlets { myView?.label = $0 }.ibAttributes { $0.tag = 1 }
        XCTAssertEqual(myView?.label?.tag, 1)
    }

}
