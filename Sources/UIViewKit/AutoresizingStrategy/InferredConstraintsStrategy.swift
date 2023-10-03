//
//  InferredConstraintsStrategy.swift
//  
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

class InferredConstraintsStrategy: UIViewDSLEngineConstraintsProtocol {
    
    
    // MARK: - Private Properties

    private var ibAttributesBlocks: [(UIView, (AnyObject) -> [NSLayoutConstraint])] = []
    
    // MARK: - UIViewDSLEngineConstraintsProtocol Methods

    func ibSubviewsWillExecute(on rootView: UIView) {
        if !ibAttributesBlocks.isEmpty {
            fatalError("Attempted to begin subviews definition while constraintsToApply is not empty. This indicates that there may have been a previous incomplete or erroneous subviews definition process.")
        }
    }
    
    func ibSubviewsDidExecute(on rootView: UIView) {
        activateAutoLayout()
    }
    
    public func addIbAttributes(_ ibAttributes: @escaping (AnyObject) -> [NSLayoutConstraint], for owner: UIView) {
        ibAttributesBlocks.append((owner, ibAttributes))
    }
    
    func ibAttributesDidExecute(on rootView: UIView) {
        activateAutoLayout()
    }
    
    // MARK: - Initializer Methods
    
    init() { }
    
    // MARK: - Private Methods
    
    private func activateAutoLayout() {
        var allConstraints: [NSLayoutConstraint] = []
        
        ibAttributesBlocks.forEach { owner, block in
            let constraints = block(owner)
            guard !constraints.isEmpty else { return }
            constraints.forEach { constraint in
                if !UIViewDSLHelper.involvesOwnerView(owner, in: constraint) {
                    fatalError("Added constraints do not involve the specified owner view. Please ensure that constraints are correctly defined for the owner view.")
                }
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
            allConstraints.append(contentsOf: constraints)
            owner.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(allConstraints)
        
        ibAttributesBlocks.removeAll()
    }
}
