//
//  IBScrollView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 12/11/2023.
//

import UIKit

@MainActor
public func IBScrollView(horizontalPadding: CGFloat = 0, backgroundColor: UIColor? = nil, with contentBuilder: () -> UIView) -> UIScrollView {
    UIScrollView().ibSubviews { scrollView in
        contentBuilder().ibAttributes {
            $0.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor)
            $0.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.contentLayoutGuide.leadingAnchor, constant: horizontalPadding)
            $0.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor)
            $0.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.contentLayoutGuide.bottomAnchor)
        }
    }.ibAttributes {
        $0.contentLayoutGuide.topAnchor.constraint(equalTo: $0.frameLayoutGuide.topAnchor)
        $0.contentLayoutGuide.leadingAnchor.constraint(equalTo: $0.frameLayoutGuide.leadingAnchor)
        $0.contentLayoutGuide.centerXAnchor.constraint(equalTo: $0.frameLayoutGuide.centerXAnchor)
        if let backgroundColor {
            $0.backgroundColor = backgroundColor
        }
    }
}
