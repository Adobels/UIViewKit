//
//  ViewInCode.swift
//  UIViewKit
//
//  Created by MaxAir on 19/10/2023.
//

import UIKit

open class ViewInCode: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    open func createView() { }
}

open class RootViewInCode: ViewInCode { }
