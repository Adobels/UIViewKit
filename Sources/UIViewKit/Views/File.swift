//
//  ContainerView.swift
//  UIViewKit
//
//  Created by blz on 02/09/2025.
//

import UIKit

public class ContainerView: UIView {
    private var controllerCreator: (() -> UIViewController)?

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init(controller: UIViewController? = nil) {
        super.init(frame: .zero)
        if let controller = controller {
            self.controllerCreator = { controller }
        }
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard let controllerCreator else { return }
        embedViewContrloller(controllerCreator())
        self.controllerCreator = nil
    }
    
    public func embedViewContrloller(_ viewControllerToEmbed: UIViewController) {
        guard let parent = nearestViewController() else { return }
        guard !subviews.contains(viewControllerToEmbed.view) else { return }
        removeChildrenWithRootView(parentViewController: parent)
        parent.ibEmbed(viewControllerToEmbed, self)
    }
    
    private func removeChildrenWithRootView(parentViewController parent: UIViewController) {
        let controllers = subviews.compactMap { subview in
            parent.children.first { $0.view === subview }
        }
        controllers.forEach { parent.ibUnembed($0) }
    }
}

private extension UIView {
    /// Returns the first UIViewController up the responder chain, if any
    func nearestViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let r = responder {
            if let vc = r as? UIViewController {
                return vc
            }
            responder = r.next
        }
        return nil
    }
}
