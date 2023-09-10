//
//  HelloWordView.swift
//  UIViewDSL
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import UIKit

class HelloWordView: UIView {

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self {
            UILabel().ibAttributes {
                $0.ibConstraints(to: self, guide: .view, anchors: .centerX, .centerY)
                $0.text = "Hello, world!"
            }
        }
    }
}

import SwiftUI
struct HelloWordViewPreviews: PreviewProvider {
    static var previews: some View {
        PreviewView(HelloWordView())
    }
}
