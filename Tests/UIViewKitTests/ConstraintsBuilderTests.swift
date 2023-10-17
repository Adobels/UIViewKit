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
        let view = UIView() { sv in
            UIView().ibAttributes {
                IBConstraints(from: $0, to: sv, guide: .view, anchors: .top)
                if true {
                    IBConstraints(from: $0, to: sv, guide: .view, anchors: .left)
                } else {
                    IBConstraints(from: $0, to: sv, guide: .view, anchors: .left)
                }
                if false {
                    IBConstraints(from: $0, to: sv, guide: .view, anchors: .right)
                } else {
                    IBConstraints(from: $0, to: sv, guide: .view, anchors: .right)
                }
                if true {
                    IBConstraints(from: $0, to: sv, guide: .view, anchors: .bottom)
                }
                print()
                $0.backgroundColor = .red
            }
            UIView().ibAttributes {
                #if DEBUG
                ibConstraints(from: $0, to: sv, guide: .view, anchors: .top)
                #endif
                if let _ = Optional(true) {
                    IBConstraints(from: $0, to: sv, guide: .view, anchors: .bottom)
                }
            }
        }
        XCTAssertEqual(view.subviews.count, 2)
        XCTAssertEqual(view.subviews.first!.backgroundColor, UIColor.red)
    }
}
