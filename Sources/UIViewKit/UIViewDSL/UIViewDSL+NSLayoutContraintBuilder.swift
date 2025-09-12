//
//  UIViewDSL+NSLayoutContraintBuilder.swift
//  UIViewKit
//
//  Created by blz on 12/09/2025.
//

import Foundation

@resultBuilder
public enum IBLayoutConstraintBuilder {

    public static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    public static func buildBlock(_ components: NSLayoutConstraint...) -> [NSLayoutConstraint] {
        components
    }

    public static func buildOptional(_ component: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        component ?? []
    }

    public static func buildEither(first component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }

    public static func buildEither(second component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }

    public static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }

    public static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    public static func buildExpression(_ expression: Any?) -> [NSLayoutConstraint] {
        []
    }
}
