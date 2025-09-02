//
//  IBPreviewSizeThatFits.swift
//  UIViewKit
//
//  Created by blz on 02/09/2025.
//

import UIKit

@available(iOS 13.0, *)
public class IBPreviewSizeThatFits: UIViewController {
    
    private var viewControllerMaker: (() -> UIViewController)?
    private var viewMaker: (() -> UIView)?
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public init(view: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.viewMaker = { view }
    }
    
    public init(_ viewMaker: @escaping () -> UIView) {
        super.init(nibName: nil, bundle: nil)
        self.viewMaker = viewMaker
    }
    
    public init(viewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerMaker = { viewController }
    }

    public init(_ viewControllerMaker: @escaping () -> UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerMaker = viewControllerMaker
    }

    public override func loadView() {
        super.loadView()
        if let viewMaker = viewMaker {
            let viewToPreview = viewMaker()
            view.ibSubviews {
                viewToPreview.ibAttributes {
                    $0.ibConstraints(to: view, guide: .view, anchors: .center)
                }
            }
            return
        } else if let viewControllerMaker = viewControllerMaker {
            let controller = viewControllerMaker()
            controller.loadViewIfNeeded()
            addChild(controller)
            view.ibSubviews { superview in
                controller.view.ibAttributes {
                    $0.ibConstraints(to: superview, guide: .view, anchors: .center)
                }
            }
            controller.didMove(toParent: self)
        } else {
            fatalError()
        }
    }

}
