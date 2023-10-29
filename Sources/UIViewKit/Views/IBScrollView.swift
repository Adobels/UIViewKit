//
//  IBScrollView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 27/10/2023.
//

import UIKit

class TestView: IBView {
    override func createView(frame: CGRect) {
        self {
            IBScrollView() {
                UIView()
            }.ibAttributes {
                $0.ibConstraints(to: self, guide: .view, anchors: .all)
            }
        }
    }
}

@MainActor
public func IBScrollView(_ contentBuilder: () -> UIView) -> UIScrollView {
    UIScrollView().ibSubviews { sv in
        contentBuilder().ibAttributes {
           $0.topAnchor.constraint(equalTo: sv.contentLayoutGuide.topAnchor)
           $0.leadingAnchor.constraint(greaterThanOrEqualTo: sv.contentLayoutGuide.leadingAnchor)
           $0.centerXAnchor.constraint(equalTo: sv.contentLayoutGuide.centerXAnchor)
           $0.bottomAnchor.constraint(greaterThanOrEqualTo: sv.contentLayoutGuide.bottomAnchor)
        }
    }
}
