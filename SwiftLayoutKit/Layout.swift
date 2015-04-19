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
/// :param: format - The visual format string
/// :param: forViews - A dictionary with views to layout
/// :param: options - An optional NSLayoutFormatOptions
/// :param: metrics - An optional dictionary with layout metrics
///
/// :returns: An array with NSLayoutConstraint objects
///
public func constraintsWith(#format: String, forViews views: [String: UIView], options: NSLayoutFormatOptions = nil, metrics: [String: CGFloat]? = nil) -> [NSLayoutConstraint] {
    
    return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views) as! [NSLayoutConstraint]
}

/// Aligns multiple views to a view by a given NSLayoutAttribute
///
/// :param: align - A NSLayoutAttribute attribute to align
/// :param: toView - A source view to align to
/// :param: forViews - A list with views to align
///
/// :returns: An array with NSLayoutConstraint objects
///
public func constraintsWith(align attribute: NSLayoutAttribute, #toView: UIView, forViews views: UIView...) -> [NSLayoutConstraint] {
    
    var constraints = [NSLayoutConstraint]()
    
    views.map({
        
        constraints.append( $0.attribute(attribute) == toView.attribute(attribute) )
    })
    
    return constraints
}
