//
//  IBAttributesTests.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 26/10/2023.
//

import XCTest
@testable import UIViewKit


@MainActor
class IBAttributesTests: XCTestCase {
    
    func testLabelText() throws {
        _ = UIView() {
            ViewWithLabel().ibAttributes {
                print($0)
                $0.font = .italicSystemFont(ofSize: 20)
                Optional<String>.none
            }
        }
    }
}

fileprivate class ViewWithLabel: IBView {
    
    var font: UIFont!
    
    override func createView(frame: CGRect) {
        super.createView(frame: frame)
        self {
            UILabel().ibAttributes {
                $0.font = font
            }
        }
    }
}
