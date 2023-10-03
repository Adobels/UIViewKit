//
//  InferredAttributesOwnerStrategy.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

public class InferredAttributesOwnerStrategy: UIViewDSLEngineConstraintsProtocol {
    
    // MARK: - Private Properties
    
    private var ibAttributesBlocks: [(UIView, (AnyObject) -> [NSLayoutConstraint])] = []
    
    
    // MARK: - UIViewDSLEngineConstraintsProtocol Methods
    
    public func addIbAttributes(_ ibAttributes: @escaping (AnyObject) -> [NSLayoutConstraint], for owner: UIView) {
        ibAttributesBlocks.append((owner, ibAttributes))
    }
    
    public func ibSubviewsWillExecute(on rootView: UIView) {
        if !ibAttributesBlocks.isEmpty {
            fatalError("Attempted to begin subviews definition while constraintsToApply is not empty. This indicates that there may have been a previous incomplete or erroneous subviews definition process.")
        }
    }
    
    public func ibSubviewsDidExecute(on rootView: UIView) {
        activateAutoLayout()
    }
    
    public func ibAttributesDidExecute(on rootView: UIView) {
        activateAutoLayout()
    }
    
    // MARK: - Initializer Methods
    
    public init() { }
    
    // MARK: - Private Methods
    
    private func activateAutoLayout() {
        var allConstraints: [NSLayoutConstraint] = []
        
        ibAttributesBlocks.forEach { owner, block in
            let constraints = block(owner)
            guard !constraints.isEmpty else { return }
            constraints.forEach {
                if !UIViewDSLHelper.involvesOwnerView(owner, in: $0) {
                    fatalError("Added constraints do not involve the specified owner view. Please ensure that constraints are correctly defined for the owner view.")
                }
            }
            allConstraints.append(contentsOf: constraints)
            owner.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(allConstraints)
        
        ibAttributesBlocks.removeAll()
    }
}
