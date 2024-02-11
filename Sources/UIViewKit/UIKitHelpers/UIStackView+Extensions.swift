//
//  UIStackView+Extensions.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

extension UIStackView {
    
    public convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) {
        self.init()
        self.axis = axis
        if let spacing {
            self.spacing = spacing
        }
        if let alignment {
            self.alignment = alignment
        }
        if let distribution {
            self.distribution = distribution
        }
    }
}

public func HorizontalStack(spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    if let alignment {
        stackView.alignment = alignment
    }
    if let distribution {
        stackView.distribution = distribution
    }
    if let spacing {
        stackView.spacing = spacing
    }
    return stackView
}

public func VerticalStack(spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    if let alignment {
        stackView.alignment = alignment
    }
    if let distribution {
        stackView.distribution = distribution
    }
    if let spacing {
        stackView.spacing = spacing
    }
    return stackView
}
