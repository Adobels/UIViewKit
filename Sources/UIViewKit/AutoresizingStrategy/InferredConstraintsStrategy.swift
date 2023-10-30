//
//  InferredConstraintsStrategy.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

class InferredConstraintsStrategy: UIViewDSLEngineConstraintsProtocol {
    
    
    // MARK: - Private Properties

    private var constraintsToApply: [(UIView, [NSLayoutConstraint])] = []
    
    // MARK: - UIViewDSLEngineConstraintsProtocol Methods

    func ibSubviewsWillExecute(on rootView: UIView) {
        if !constraintsToApply.isEmpty {
            fatalError("Attempted to begin subviews definition while constraintsToApply is not empty. This indicates that there may have been a previous incomplete or erroneous subviews definition process.")
        }
    }
    
    func ibSubviewsDidExecute(on rootView: UIView) {
        activateAutoLayout()
    }
    
    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) {
        guard !constraints.isEmpty else { return }
        constraints.forEach {
            if !UIViewDSLHelper.involvesOwnerView(owner, in: $0) {
                fatalError("Added constraints do not involve the specified owner view. Please ensure that constraints are correctly defined for the owner view.")
            }
        }
        constraintsToApply.append((owner, constraints))
    }
    
    func ibAttributesDidExecute(on rootView: UIView) {
        activateAutoLayout()
    }
    
    #if DEBUG
    var constraintsToApplyForDebug: [(UIView, [NSLayoutConstraint])] {
        constraintsToApply
    }
    #endif
    
    // MARK: - Initializer Methods
    
    init() { }
    
    // MARK: - Private Methods
    
    private func activateAutoLayout() {
        var allConstraints: [NSLayoutConstraint] = []
        constraintsToApply.forEach { owner, constraints in
            allConstraints.append(contentsOf: constraints)
            for constraint in constraints {
                if let firstView = constraint.firstItem as? UIView {
                    if firstView.superview != nil {
                        firstView.translatesAutoresizingMaskIntoConstraints = false
                    }
                }
                if let secondView = constraint.secondItem as? UIView {
                    if secondView.superview != nil {
                        secondView.translatesAutoresizingMaskIntoConstraints = false
                    }
                }
            }
        }
        NSLayoutConstraint.activate(allConstraints)
        constraintsToApply.removeAll()
    }
}
