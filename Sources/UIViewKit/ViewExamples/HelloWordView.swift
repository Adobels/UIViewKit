//
//  HelloWordView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import UIKit

public class HelloWordView: UIView {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self {
            UILabel().ibOutlet(&label).ibAttributes {
                $0.ibConstraints(to: self, guide: .view, anchors: .centerX, .centerY)
                $0.text = "Hello, world!"
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
