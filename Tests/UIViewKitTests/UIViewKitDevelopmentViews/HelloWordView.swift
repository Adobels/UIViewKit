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
        self {
            UILabel().ibOutlet(&label).ibAttributes {
                IBConstraints.create(from: $0, to: self, guide: .view, anchors: .centerX, .centerY)
                $0.text = "Hello, world!"
            }
        }.ibAttributes {
            $0.backgroundColor = .systemBackground
        }
    }

    required init?(coder: NSCoder) { fatalError() }
}
