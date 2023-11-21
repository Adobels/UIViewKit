//
//  UIViewDSL+Engine.swift
//
//
//  Created by MaxAir on 21/11/2023.
//

import UIKit

@MainActor
public class UIViewDSLEngine {

    // MARK: - Public Properties

    public weak var delegate: UIViewDSLEngineConstraintsProtocol?

    // MARK: - Private Properties

    private var ibSubviewsDepthCallCounter: Int = 0
    private var defaultDelegate: UIViewDSLEngineConstraintsProtocol?

    // MARK: - Singleton Instance

    public static let shared: UIViewDSLEngine = {
        let instance = UIViewDSLEngine()
        instance.setupDefaultDelegate()
        return instance
    }()

    // MARK: - Initializers

    private init() { }

    // MARK: - Public Methods

    func addSubviews(_ subviews: (UIView) -> [UIView], to owner: UIView) {
        beginSubviewsDefinition()
        UIViewDSLHelper.addSubviews(subviews(owner), to: owner)
        endSubviewsDefinition(on: owner)
    }

    func addSubviews(_ subviews: () -> [UIView], to owner: UIView) {
        beginSubviewsDefinition()
        UIViewDSLHelper.addSubviews(subviews(), to: owner)
        endSubviewsDefinition(on: owner)
    }

    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) {
        delegate?.addConstraints(for: owner, constraints: constraints)
        if ibSubviewsDepthCallCounter == 0 {
            delegate?.ibAttributesDidExecute(on: owner)
        }
    }

    #if DEBUG
    var constraintsToApplyForDebug: [(UIView, [NSLayoutConstraint])] {
        delegate!.constraintsToApplyForDebug
    }
    #endif

    // MARK: - Private Methods

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
