//
//  ContainerView.swift
//  UIViewKit
//
//  Created by blz on 02/09/2025.
//

import UIKit

public class IBContainerView: UIView {

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
        self.controllerCreator = nil
        embed(controllerCreator())
    }
    
    public func ibEmbed(_ viewControllerToEmbed: UIViewController) {
        self.controllerCreator = { viewControllerToEmbed }
    }
    
    private func embed(_ viewControllerToEmbed: UIViewController) {
        guard let parent = nearestViewController() else { return }
        parent.ibEmbed(viewControllerToEmbed, self)
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
