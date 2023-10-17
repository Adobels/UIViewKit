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
    var label2: UILabel?
    
    enum Constant {
        enum Font {
            static let rib = UIFont.systemFont(ofSize: 15)
            static let iban = UIFont.systemFont(ofSize: 20)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self {
            UILabel().ibOutlet(&label).ibAttributes {
                ibConstraints(from: $0, to: self, guide: .view, anchors: .centerX, .centerY)
                $0.text = "Hello, world!"
            }
            HelloWordView().ibAttributes {
                $0.label.font = .init(name: "Arial", size: 15)
                $0.label2?.font = .init(name: "Arial", size: 15)
            }
            UILabel().ibAttributes {
                $0.ibOutlet(&label)
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
