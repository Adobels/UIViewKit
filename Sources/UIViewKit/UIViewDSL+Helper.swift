//
//  UIViewDSL+Helper.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

enum UIViewDSLHelper {

    static func involvesOwnerView(_ owner: UIView, in constraint: NSLayoutConstraint) -> Bool {
        var ownerView: [UIView] = []

        if let layoutGuide = constraint.firstItem as? UILayoutGuide, let owningView = layoutGuide.owningView {
            ownerView.append(owningView)
        }
        if let layoutGuide = constraint.secondItem as? UILayoutGuide, let owningView = layoutGuide.owningView {
            ownerView.append(owningView)
        }
        if let owningView = constraint.firstItem as? UIView {
            ownerView.append(owningView)
        }
        if let owningView = constraint.secondItem as? UIView {
            ownerView.append(owningView)
        }
        return ownerView.contains(where: { $0 == owner })
    }

    static func addSubviews(_ subviews: [UIView], to target: UIView) {
        let adderFunction: (UIView) -> Void

        if let stackView = target as? UIStackView {
            adderFunction = stackView.addArrangedSubview(_:)
        } else {
            adderFunction = target.addSubview(_:)
        }

        subviews.forEach(adderFunction)
    }
}

extension UIViewDSL {

    @discardableResult
    public func ibSetAsRootView(of controller: UIViewController) -> Self {
        guard let view = self as? UIView else {
            fatalError()
        }
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = controller.view.frame
        view.layoutIfNeeded()
        controller.view = view
        return self
    }
}
