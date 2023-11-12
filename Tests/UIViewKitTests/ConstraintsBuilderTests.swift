//
//  ConstraintsBuilderTests.swift
//  UIViewKitTests
//
//  Created by Blazej SLEBODA on 20/09/2023.
//

import XCTest
@testable import UIViewKit

@MainActor
class ConstraintsBuilderTests: XCTestCase {
    func test() throws {
        let view = UIView { sv in
            UIView().ibAttributes {
                $0.ibConstraints(to: sv, guide: .view, anchors: .top)
                if true {
                    $0.ibConstraints(to: sv, guide: .view, anchors: .left)
                } else {
                    $0.ibConstraints(to: sv, guide: .view, anchors: .left)
                }
                if false {
                    $0.ibConstraints(to: sv, guide: .view, anchors: .right)
                } else {
                    $0.ibConstraints(to: sv, guide: .view, anchors: .right)
                }
                if true {
                    $0.ibConstraints(to: sv, guide: .view, anchors: .bottom)
                }
                print()
                $0.backgroundColor = .red
            }
            UIView().ibAttributes {
                #if DEBUG
                $0.ibConstraints(to: sv, guide: .view, anchors: .top)
                #endif
                if Optional(true) != nil {
                    $0.ibConstraints(to: sv, guide: .view, anchors: .bottom)
                }
            }
        }
        XCTAssertEqual(view.subviews.count, 2)
        XCTAssertEqual(view.subviews.first!.backgroundColor, UIColor.red)
    }
}
