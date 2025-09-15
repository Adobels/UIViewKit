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
        _ = UIView().ibSubviews {
            ViewWithLabel().ibAttributes {
                print($0)
                $0.font = .italicSystemFont(ofSize: 20)
                Optional<String>.none
            }
        }
    }
}

private class ViewWithLabel: UIView {

    var font: UIFont!

    required init?(coder: NSCoder) {
        fatalError()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.ibSubviews {
            UILabel().ibAttributes {
                $0.font = font
            }
        }
    }
}
