//
//  ViewExtensions.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

public extension UIView {
    
    func attribute(type: NSLayoutAttribute) -> LayoutAttribute {
        
        return AutoLayoutAttribute(type: type, view: self)
    }
}
