//
//  ViewExtensionsTests.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit
import XCTest

class ViewExtensionsTests: XCTestCase {
    
    func testThatWillReturnLayoutAttribute() {
        
        let view = UIView()
        
        let attribute = view.attribute(.Top)
        
        XCTAssert(attribute.type == .Top, "Attributes types should match")
        XCTAssert(attribute.view === view, "Views should match")
    }
}
