//
//  IBControl.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 12/11/2023.
//

import UIKit

open class IBControl: UIControl {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        createView(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    open func createView(frame: CGRect) { }
}
