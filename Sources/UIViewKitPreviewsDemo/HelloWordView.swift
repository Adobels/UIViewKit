//
//  HelloWordView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import UIKit
import UIViewKit

public class HelloWordView: UIView {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        UIViewDSLEngine.layoutMode = .manual
        // Automatic Reference Counting = ARC
        // Manual Reference Counting = MRC
        // Manual TAMIC
        // Disable TAMIC from InferredConstraints
        // Disable TAMIC from InferredAttributesOwner
        self {
            UILabel().ibOutlet(&label).ibAttributes {
                $0.ibConstraints(to: self, guide: .view, anchors: .centerX, .centerY)
                $0.text = "Hello, world!"
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

#if DEBUG

import SwiftUI

struct HelloWordViewPreviews: PreviewProvider {
    static var previews: some View {
        ViewPreview(HelloWordView())
    }
}

#endif
