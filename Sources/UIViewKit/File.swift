//
//  File.swift
//  
//
//  Created by MaxAir on 27/10/2023.
//

import UIKit

class IBScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    func addStackView(_ stackView: UIStackView) {
        self {
            stackView.ibAttributes {
                $0.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor)
                $0.leadingAnchor.constraint(greaterThanOrEqualTo: contentLayoutGuide.leadingAnchor)
                $0.centerXAnchor.constraint(equalTo: contentLayoutGuide.centerXAnchor)
                $0.bottomAnchor.constraint(greaterThanOrEqualTo: contentLayoutGuide.bottomAnchor)
            }
        }.ibAttributes {
            $0.contentLayoutGuide.topAnchor.constraint(equalTo: $0.frameLayoutGuide.topAnchor)
            $0.contentLayoutGuide.leadingAnchor.constraint(equalTo: $0.frameLayoutGuide.leadingAnchor)
            $0.contentLayoutGuide.centerXAnchor.constraint(equalTo: $0.frameLayoutGuide.centerXAnchor)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func createView() {

    }
}
