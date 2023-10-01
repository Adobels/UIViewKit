//
//  AutoresizingStrategy.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

public protocol UIViewDSLEngineConstraintsProtocol: AnyObject {
    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint])
    func rootViewIbSubviewsWillExecute()
    func rootViewIbSubviewsDidExecute()
    func addRootViewConstraints(on rootView: UIView, constraints: [NSLayoutConstraint])
}

enum AutoresizingStrategyError: Error {
    case constraintIsNotValid
}
