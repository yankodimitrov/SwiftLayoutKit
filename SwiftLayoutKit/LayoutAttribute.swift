//
//  LayoutAttribute.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

public protocol LayoutAttribute {
    
    var type: NSLayoutAttribute {get}
    var view: UIView {get}
    var multiplier: CGFloat {get}
    var constant: CGFloat {get}
    var priority: Float {get}
    
    func makeConstraintWith(#relation: NSLayoutRelation, toAttribute: LayoutAttribute?) -> NSLayoutConstraint
}
