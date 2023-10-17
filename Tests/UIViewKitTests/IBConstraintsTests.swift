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
    
    func testRunDifferentConfigurations() throws {
        let view = UIView()
        let subview = UIView()
        
        view {
            subview.ibAttributes {
                ibConstraints(from: $0, to: view, guide: .view, anchors: .all)
                ibConstraints(from: $0, to: view, guide: .view, anchors: .top, .left, .right, .bottom)
                ibConstraints(from: $0, to: view, guide: .view, anchors: .top(1), .left(1), .right(-1), .bottom(-1))
                ibConstraints(from: $0, to: view, guide: .view, anchors: .top, .leading, .trailing, .bottom)
                ibConstraints(from: $0, to: view, guide: .view, anchors: .top(1), .leading(1), .trailing(-1), .bottom(-1))
                ibConstraints(from: $0, to: view, guide: .view, anchors: .centerX, .centerY)
                ibConstraints(from: $0, to: view, guide: .view, anchors: .centerX(1), .centerY(1))
                ibConstraints(from: $0, to: view, guide: .viewMargins, anchors: .all)
                ibConstraints(from: $0, to: view, guide: .viewSafeArea, anchors: .all)
            }
        }
    }
}
