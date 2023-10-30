//
//  IBView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 19/10/2023.
//

import UIKit

open class IBView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        createView(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    open func createView(frame: CGRect) { }
}

extension UILabel {
    
    public convenience init(_ text: String) {
        self.init(frame: .zero)
        self.text = text
    }
}
