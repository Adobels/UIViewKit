//
//  UIViewDSL+SwiftUIStyleStacks.swift
//
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

public class HorizontalStack: UIStackView {
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
    }
    
    public init(spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) {
        self.init()
        self.axis = .horizontal
        if let alignment {
            self.alignment = alignment
        }
        if let distribution {
            self.distribution = distribution
        }
        if let spacing {
            self.spacing = spacing
        }
    }
}

public class VerticalStack: UIStackView {
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
    }

    public init(spacing: CGFloat? = nil, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil) {
        self.init()
        self.axis = .vertical
        if let alignment {
            self.alignment = alignment
        }
        if let distribution {
            self.distribution = distribution
        }
        if let spacing {
            self.spacing = spacing
        }
    }
}
