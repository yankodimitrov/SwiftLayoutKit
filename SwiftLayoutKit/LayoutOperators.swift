//
//  LayoutOperators.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

///////////////////////////////////////////////////////
// MARK: - Add Constraint/s
///////////////////////////////////////////////////////

infix operator +| { associativity left precedence 88 }

/// Adds NSLayoutConstraint to a view
public func +| (left: UIView, constraint: NSLayoutConstraint) {
    
    left.addConstraint(constraint)
}

/// Adds NSLayoutConstraints to a view
public func +| (left: UIView, constraints: [NSLayoutConstraint]) {
    
    left.addConstraints(constraints)
}

///////////////////////////////////////////////////////
// MARK: - Priority
///////////////////////////////////////////////////////

infix operator ~ { associativity left precedence 138 }

/// Set the NSLayoutConstraint's priority
public func ~ (left: LayoutAttribute, priority: Float) -> LayoutAttribute {
    
    return AutoLayoutAttribute(attribute: left, priority: priority)
}

///////////////////////////////////////////////////////
// MARK: - Equality
///////////////////////////////////////////////////////

public func == (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    
    return left.makeConstraintWith(relation: .Equal, toAttribute: right)
}

public func == (left: LayoutAttribute, constant: CGFloat) -> NSLayoutConstraint {
    
    let attribute = AutoLayoutAttribute(attribute: left, constant: constant)
    
    return attribute.makeConstraintWith(relation: .Equal, toAttribute: nil)
}

///////////////////////////////////////////////////////
// MARK: - Inequality
///////////////////////////////////////////////////////

public func >= (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    
    return left.makeConstraintWith(relation: .GreaterThanOrEqual, toAttribute: right)
}

public func >= (left: LayoutAttribute, constant: CGFloat) -> NSLayoutConstraint {
    
    let attribute = AutoLayoutAttribute(attribute: left, constant: constant)
    
    return attribute.makeConstraintWith(relation: .GreaterThanOrEqual, toAttribute: nil)
}

public func <= (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    
    return left.makeConstraintWith(relation: .LessThanOrEqual, toAttribute: right)
}

public func <= (left: LayoutAttribute, constant: CGFloat) -> NSLayoutConstraint {
    
    let attribute = AutoLayoutAttribute(attribute: left, constant: constant)
    
    return attribute.makeConstraintWith(relation: .LessThanOrEqual, toAttribute: nil)
}

///////////////////////////////////////////////////////
// MARK: - Addition
///////////////////////////////////////////////////////

public func + (left: LayoutAttribute, constant: CGFloat) -> LayoutAttribute {
    
    return AutoLayoutAttribute(attribute: left, constant: left.constant + constant)
}

///////////////////////////////////////////////////////
// MARK: - Subtraction
///////////////////////////////////////////////////////

public func - (left: LayoutAttribute, constant: CGFloat) -> LayoutAttribute {
    
    return AutoLayoutAttribute(attribute: left, constant: left.constant - constant)
}

///////////////////////////////////////////////////////
// MARK: - Multiplication
///////////////////////////////////////////////////////

public func * (left: LayoutAttribute, multiplier: CGFloat) -> LayoutAttribute {
    
    return AutoLayoutAttribute(attribute: left, multiplier: multiplier)
}

///////////////////////////////////////////////////////
// MARK: - Division
///////////////////////////////////////////////////////

public func / (left: LayoutAttribute, divider: CGFloat) -> LayoutAttribute {
    
    return AutoLayoutAttribute(attribute: left, multiplier: left.multiplier / divider)
}
