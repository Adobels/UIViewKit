//
//  ViewSubviewHasConstraintsToItsSuperviewN2.swift
//  UIViewKitPreviewsDemo
//
//  Created by Blazej SLEBODA on 23/09/2023.
//

import UIKit
import UIViewKit

class TestView: UIView {
    
    var view2: UIView = .init()
    var view3: UIView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self {
            view2 {
                view3.ibAttributes {
                    $0.tag = 3
                    ibConstraints(from: $0, to: self, guide: .view, anchors: .all)
                    $0.backgroundColor = .green
                    $0.alpha = 0.3
                }
            }.ibAttributes {
                $0.tag = 2
                $0.backgroundColor = .red
                $0.alpha = 0.7
                $0.frame = .init(origin: .init(x: 100, y: 100), size: .init(width: 100, height: 100))
            }
        }.ibAttributes {
            $0.tag = 1
        }
        UIViewDebug.showFrames(of: self, includeGivenView: true, includeUIKitPrivateViews: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

#if DEBUG

import SwiftUI

@available(iOS 14.0, *)
struct TestViewPreviews: PreviewProvider {
    static var previews: some View {
        ViewPreview(TestView()).ignoresSafeArea()
    }
}

#endif
