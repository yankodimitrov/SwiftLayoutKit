//
//  Layout.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

/// Produces NSLayoutConstraints by using the visual format language
///
/// - parameter format: - The visual format string
/// - parameter forViews: - A dictionary with views to layout
/// - parameter options: - An optional NSLayoutFormatOptions
/// - parameter metrics: - An optional dictionary with layout metrics
///
/// - returns: An array with NSLayoutConstraint objects
///
public func constraintsWith(format format: String, forViews views: [String: UIView], options: NSLayoutFormatOptions = [] , metrics: [String: CGFloat]? = nil) -> [NSLayoutConstraint] {
    
    return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views)
}

/// Aligns multiple views to a view by a given NSLayoutAttribute
///
/// - parameter align: - A NSLayoutAttribute attribute to align
/// - parameter toView: - A source view to align to
/// - parameter forViews: - A list with views to align
///
/// - returns: An array with NSLayoutConstraint objects
///
public func constraintsWith(align attribute: NSLayoutAttribute, toView: UIView, forViews views: UIView...) -> [NSLayoutConstraint] {
    
    var constraints = [NSLayoutConstraint]()
    
    views.map({
        
        constraints.append( $0.attribute(attribute) == toView.attribute(attribute) )
    })
    
    return constraints
}
