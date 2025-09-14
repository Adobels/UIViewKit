//
//  UIViewDSL+IBArrayOfUIViewBuilder.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

@resultBuilder
public enum IBArrayOfUIViewBuilder {

    public static func buildBlock(_ components: [UIView]...) -> [UIView] {
        components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: UIView) -> [UIView] {
        [expression]
    }

    public static func buildExpression(_ expression: [UIView]) -> [UIView] {
        expression
    }

    public static func buildExpression(_ expression: Void) -> [UIView] {
        []
    }

    public static func buildOptional(_ component: [UIView]?) -> [UIView] {
        component.flatMap { $0 } ?? []
    }

    public static func buildEither(first component: [UIView]) -> [UIView] {
        component
    }

    public static func buildEither(second component: [UIView]) -> [UIView] {
        component
    }

    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        components.flatMap { $0 }
    }
}
