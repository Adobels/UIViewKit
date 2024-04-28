//
//  IBMeasure.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 11/03/2024.
//

import UIKit

public final class IBMeasure {

    private init() {}

    @MainActor
    public static func printVerticalDistance(from: NSLayoutAnchor<NSLayoutYAxisAnchor>, to: NSLayoutAnchor<NSLayoutYAxisAnchor>, rootView: UIView) {
        rootView.ibSubviews {
            MeasureView().ibAttributes {
                $0.widthAnchor.constraint(equalToConstant: 1)
                $0.topAnchor.constraint(equalTo: from)
                $0.bottomAnchor.constraint(equalTo: to)
            }
        }
    }

    @MainActor
    public static func printHorizontalDistance(fromLeft: NSLayoutAnchor<NSLayoutXAxisAnchor>, toRight: NSLayoutAnchor<NSLayoutXAxisAnchor>, rootView: UIView) {
        rootView.ibSubviews {
            MeasureView().ibAttributes {
                $0.heightAnchor.constraint(equalToConstant: 1)
                $0.leftAnchor.constraint(equalTo: fromLeft)
                $0.rightAnchor.constraint(equalTo: toRight)
            }
        }
    }

    private class MeasureView: UIView {
        override func layoutSubviews() {
            super.layoutSubviews()
            print(frame.height)
        }
    }
}
