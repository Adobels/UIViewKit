//
//  AutoresizingStrategy.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

protocol UIViewDSLEngineConstraintsProtocol: AnyObject {
    func validateConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) throws
    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint])
    func rootViewIbSubviewsWillExecute()
    func rootViewIbSubviewsDidExecute()
    func addRootViewConstraints(on rootView: UIView, constraints: [NSLayoutConstraint])
}

extension UIViewDSLEngineConstraintsProtocol {
    
    func validateConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) throws {
        for constraint in constraints {
            guard UIViewDSLHelper.involvesOwnerView(owner, in: constraint) else {
                throw AutoresizingStrategyError.constraintIsNotValid
                // "Added constraints do not involve the specified owner view. Please ensure that constraints are correctly defined for the owner view."
            }
        }
    }
}

//
//protocol AutoresizingStrategy {
//    func apply(for owner: UIView, with constraints: [NSLayoutConstraint])
//    func validateConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) throws
//}
//
//extension AutoresizingStrategy {
//    
//    func validateConstraints(for owner: UIView, constraints: [NSLayoutConstraint]) throws {
//        for constraint in constraints {
//            guard UIViewDSLHelper.involvesOwnerView(owner, in: constraint) else {
//                throw AutoresizingStrategyError.constraintIsNotValid
//                // "Added constraints do not involve the specified owner view. Please ensure that constraints are correctly defined for the owner view."
//            }
//        }
//    }
//}

enum AutoresizingStrategyError: Error {
    case constraintIsNotValid
}
