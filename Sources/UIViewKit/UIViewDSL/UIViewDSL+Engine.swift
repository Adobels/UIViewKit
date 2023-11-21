//
//  UIViewDSL+Engine.swift
//
//
//  Created by MaxAir on 21/11/2023.
//

import UIKit

@MainActor
public class UIViewDSLEngine {

    // MARK: Public

    public static let shared: UIViewDSLEngine = {
        let instance = UIViewDSLEngine()
        instance.setupDefaultDelegate()
        return instance
    }()

    public weak var delegate: UIViewDSLEngineConstraintsProtocol?

    // MARK: Internal

    func addSubviews(_ subviews: (UIView) -> [UIView], to owner: UIView) {
        beginSubviewsDefinition()
        Helper.addSubviews(subviews(owner), to: owner)
        endSubviewsDefinition(on: owner)
    }

    func addSubviews(_ subviews: () -> [UIView], to owner: UIView) {
        beginSubviewsDefinition()
        Helper.addSubviews(subviews(), to: owner)
        endSubviewsDefinition(on: owner)
    }

    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) {
        delegate?.addConstraints(for: owner, constraints: constraints)
        if ibSubviewsDepthCallCounter == 0 {
            delegate?.ibAttributesDidExecute(on: owner)
        }
    }

    // MARK: - Private

    private var ibSubviewsDepthCallCounter: Int = 0
    private var defaultDelegate: UIViewDSLEngineConstraintsProtocol?

    private init() { }

    private func setupDefaultDelegate() {
        defaultDelegate = InferredAttributesOwnerStrategy()
        delegate = defaultDelegate
    }

    private func beginSubviewsDefinition() {
        ibSubviewsDepthCallCounter += 1
    }

    private func endSubviewsDefinition(on owner: UIView) {
        ibSubviewsDepthCallCounter -= 1
        if ibSubviewsDepthCallCounter == 0 {
            delegate?.ibSubviewsDidExecute(on: owner)
        }
    }
}

extension UIViewDSLEngine {

    @MainActor
    struct Helper {

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
}

#if DEBUG

extension UIViewDSLEngine {

    var constraintsToApplyForDebug: [(UIView, [NSLayoutConstraint])] {
        delegate!.constraintsToApplyForDebug
    }
}

#endif
