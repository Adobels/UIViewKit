//
//  UIViewDSL.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/09/2023.
//

import UIKit

public protocol UIViewDSL { }; extension UIView: UIViewDSL { }

@MainActor
public class UIViewDSLEngine {
    
    // MARK: - Public Properties
    
    weak var delegate: UIViewDSLEngineConstraintsProtocol?
    
    // MARK: - Private Properties
    
    private var ibSubviewsDepthCallCounter: Int = 0
    private var defaultDelegate: UIViewDSLEngineConstraintsProtocol?
    
    // MARK: - Singleton Instance
    
    static let shared: UIViewDSLEngine = {
        let instance = UIViewDSLEngine()
        instance.setupDefaultDelegate()
        return instance
    }()
    
    // MARK: - Initializers
    
    private init() { }
    
    // MARK: - Public Methods
    
    func addSubviews(_ subviews: (UIView) -> [UIView], to owner: UIView) {
        beginSubviewsDefinition()
        debugPrint("didBeginDepth \(ibSubviewsDepthCallCounter) owner: \(owner)")
        UIViewDSLHelper.addSubviews(subviews(owner), to: owner)
        endSubviewsDefinition()
        debugPrint("didBeginEnd \(ibSubviewsDepthCallCounter) owner: \(owner)")
    }
    
    func addSubviews(_ subviews: () -> [UIView], to owner: UIView) {
        beginSubviewsDefinition()
        debugPrint("didBeginDepth \(ibSubviewsDepthCallCounter) owner: \(owner)")
        UIViewDSLHelper.addSubviews(subviews(), to: owner)
        endSubviewsDefinition()
        debugPrint("didBeginEnd \(ibSubviewsDepthCallCounter) owner: \(owner)")
    }
    
    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) {
        delegate?.addConstraints(for: owner, constraints: constraints)
        if ibSubviewsDepthCallCounter == 0 {
            delegate?.addRootViewConstraints(on: owner, constraints: constraints)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupDefaultDelegate() {
        defaultDelegate = InferredAttributesOwnerStrategy()
        delegate = defaultDelegate
    }
    
    private func beginSubviewsDefinition() {
        ibSubviewsDepthCallCounter += 1
    }
    
    private func endSubviewsDefinition() {
        ibSubviewsDepthCallCounter -= 1
        if ibSubviewsDepthCallCounter == 0 {
            delegate?.rootViewIbSubviewsDidExecute()
        }
        debugPrint("didEndDepth \(ibSubviewsDepthCallCounter)")
    }
}
