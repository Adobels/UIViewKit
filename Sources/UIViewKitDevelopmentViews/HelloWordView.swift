//
//  HelloWordView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 15/09/2023.
//

import UIKit
import UIViewKit
import UIViewDSL

public class HelloWordView: UIView {

    var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self {
            UILabel().ibOutlet(&label).ibAttributes {
                ibConstraints(from: $0, to: self, guide: .view, anchors: .centerX, .centerY)
                $0.text = "Hello, world!"
            }
        }
    }

    required init?(coder: NSCoder) { fatalError() }
}

#if DEBUG

@available(iOS 17.0, *)
#Preview("Default") {
    HelloWordView()
}

#endif
