//
//  UIViewDSLEngineConstraintsProtocol.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

public protocol UIViewDSLEngineConstraintsProtocol: AnyObject {
    func addConstraints(for owner: UIView, constraints: [NSLayoutConstraint])
    func ibSubviewsWillExecute(on rootView: UIView)
    func ibSubviewsDidExecute(on rootView: UIView)
    func ibAttributesDidExecute(on rootView: UIView)
}
