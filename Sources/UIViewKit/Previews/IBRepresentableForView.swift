//
//  IBRepresentableForView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 16/11/2023.
//

#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
public struct IBRepresentableForView: UIViewRepresentable {

    private let viewMaker: () -> UIView

    public init(_ viewMaker: @escaping @autoclosure () -> UIView) {
        self.viewMaker = viewMaker
    }

    public init(_ viewMaker: @escaping () -> UIView) {
        self.viewMaker = viewMaker
    }

    public func makeUIView(context: Context) -> UIView {
        UIView().ibSubviews { containerView in
            viewMaker().ibAttributes {
                $0.topAnchor.constraint(equalTo: containerView.topAnchor).ibPriority(.init(1))
                $0.leftAnchor.constraint(equalTo: containerView.leftAnchor).ibPriority(.init(1))
                $0.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
                $0.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            }
        }
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        uiView.setNeedsUpdateConstraints()
    }
}

#endif
