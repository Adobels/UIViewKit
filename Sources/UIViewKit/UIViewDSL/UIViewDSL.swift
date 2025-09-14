//
//  UIViewDSL.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 10/09/2023.
//

import UIKit

public protocol UIViewDSL where Self: UIView { }

extension UIView: UIViewDSL { }
