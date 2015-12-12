//
//  AutoLayoutAttribute.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

struct AutoLayoutAttribute: LayoutAttribute {
    
    let type: NSLayoutAttribute
    let view: UIView
    let multiplier: CGFloat
    let constant: CGFloat
    let priority: Float
    
    init(type: NSLayoutAttribute, view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000) {
        
        self.type = type
        self.view = view
        self.multiplier = multiplier
        self.constant = constant
        self.priority = priority
    }
    
    init(attribute: LayoutAttribute, multiplier: CGFloat) {
        
        self.init(type: attribute.type, view: attribute.view, multiplier: multiplier, constant: attribute.constant, priority: attribute.priority)
    }
    
    init(attribute: LayoutAttribute, constant: CGFloat) {
        
        self.init(type: attribute.type, view: attribute.view, multiplier: attribute.multiplier, constant: constant, priority: attribute.priority)
    }
    
    init(attribute: LayoutAttribute, priority: Float) {
        
        self.init(type: attribute.type, view: attribute.view, multiplier: attribute.multiplier, constant: attribute.constant, priority: priority)
    }
    
    func makeConstraintWith(relation relation: NSLayoutRelation, toAttribute: LayoutAttribute?) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: view,
            attribute: type,
            relatedBy: relation,
            toItem: toAttribute?.view ?? nil,
            attribute: toAttribute?.type ?? .NotAnAttribute,
            multiplier: toAttribute?.multiplier ?? multiplier,
            constant: toAttribute?.constant ?? constant
        )
        
        constraint.priority = priority
        
        return constraint
    }
}
