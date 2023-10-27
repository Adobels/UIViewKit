//
//  UIViewDSL+ResultBuilders.swift
//
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

@resultBuilder
public enum UIViewBuilder {
    
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
}

@resultBuilder
public enum NSLayoutConstraintBuilder {
    
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
