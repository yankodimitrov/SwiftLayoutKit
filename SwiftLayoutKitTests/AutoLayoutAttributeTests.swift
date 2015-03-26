//
//  AutoLayoutAttributeTests.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit
import XCTest

class AutoLayoutAttributeTests: XCTestCase {
    
    let attributeType: NSLayoutAttribute = .Top
    
    lazy var view: UIView = {
        
        let view = UIView()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        return view
        }()
    
    var layoutAttribute: AutoLayoutAttribute {
        
        return AutoLayoutAttribute(type: self.attributeType, view: self.view)
    }
    
    let multiplier: CGFloat = 2
    let constant: CGFloat = 20
    let priority: Float = 700
    
    ///////////////////////////////////////////////////////
    // MARK: - Tests
    ///////////////////////////////////////////////////////
    
    func testThatWeCanMakeInstance() {
        
        let attribute = AutoLayoutAttribute(type: attributeType, view: view)
        
        XCTAssert(attribute.view === view, "Views should match")
        XCTAssertEqual(attribute.type, attributeType, "Attributes types should match")
        XCTAssert(attribute.multiplier == 1, "Initial multiplier should be equal to 1")
        XCTAssert(attribute.constant == 0, "Initial constant should be equal to 0")
        XCTAssert(attribute.priority == 1000, "Initial priority should be equal to 1000 (UILayoutPriorityRequired)")
    }
    
    func testThatWeCanMakeInstanceWithLayoutAttributeAndMultiplier() {
        
        let attribute = AutoLayoutAttribute(attribute: layoutAttribute, multiplier: multiplier)
        
        XCTAssert(attribute.multiplier == multiplier, "Multipliers should match")
    }
    
    func testThatWeCanMakeInstanceWithLayoutAttributeAndConstant() {
        
        let attribute = AutoLayoutAttribute(attribute: layoutAttribute, constant: constant)
        
        XCTAssert(attribute.constant == constant, "Constants should match")
    }
    
    func testThatWeCanMakeInstanceWithLayoutAttributeAndPriority() {
        
        let attribute = AutoLayoutAttribute(attribute: layoutAttribute, priority: priority)
        
        XCTAssert(attribute.priority == priority, "Priorities should match")
    }
    
    func testThatWeCanMakeConstraintWithRelationToLayoutAttribute() {
        
        let secondView = UIView()
        secondView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let secondAttribute = AutoLayoutAttribute(type: .Bottom, view: secondView, multiplier: multiplier, constant: constant, priority: priority)
        
        let constraint = layoutAttribute.makeConstraintWith(relation: .Equal, toAttribute: secondAttribute)
        
        XCTAssert(constraint.firstItem === layoutAttribute.view, "Should point to the view in the first attribute")
        XCTAssert(constraint.firstAttribute == layoutAttribute.type, "Should be equal to the type of the first layout attribute")
        XCTAssert(constraint.relation == .Equal, "Relations should match")
        XCTAssert(constraint.secondItem === secondAttribute.view, "Should point to the view in the second attribute")
        XCTAssert(constraint.secondAttribute == secondAttribute.type, "Should be equal to the type of the second layout attribute")
        
        XCTAssertEqual(constraint.multiplier, multiplier, "Multipliers should match")
        XCTAssertEqual(constraint.constant, constant, "Constants should match")
        XCTAssertEqual(constraint.priority, layoutAttribute.priority, "Should be equal to the priority of the first layout attribute")
    }
    
    func testThatWeCanMakeConstraintWithNoRelaton() {
        
        let attribute = AutoLayoutAttribute(type: .Width, view: view, multiplier: 1, constant: constant, priority: priority)
        
        let constraint = attribute.makeConstraintWith(relation: .Equal, toAttribute: nil)
        
        XCTAssert(constraint.firstItem === attribute.view, "Should point to the view in the attribute")
        XCTAssert(constraint.firstAttribute == attribute.type, "Should be equal to the type of the layout attribute")
        XCTAssert(constraint.relation == .Equal, "Relations should match")
        
        XCTAssert(constraint.multiplier == 1, "Multipliers should match")
        XCTAssertEqual(constraint.constant, constant, "Constants should match")
        XCTAssertEqual(constraint.priority, priority, "Priorities should match")
    }
}
