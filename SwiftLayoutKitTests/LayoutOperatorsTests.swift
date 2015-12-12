//
//  LayoutOperatorsTests.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit
import XCTest

class LayoutOperatorsTests: XCTestCase {
    
    func testAddConstraintOperatorWithSingleConstraint() {
        
        let constraint = NSLayoutConstraint()
        let containerView = UIView()
        
        containerView +| constraint
        
        XCTAssertGreaterThan(containerView.constraints.count, 0, "We should be able to add constraint")
    }
    
    func testAddConstraintOperatorWithMultipleConstraints() {
        
        let constraintOne = NSLayoutConstraint()
        let constraintTwo = NSLayoutConstraint()
        let containerView = UIView()
        
        containerView +| [constraintOne, constraintTwo]
        
        XCTAssertGreaterThan(containerView.constraints.count, 0, "We should be able to add constraints")
    }
    
    func testPriorityOperator() {
        
        let priority: Float = 100
        let someAttribute = AutoLayoutAttribute(type: .Top, view: UIView())
        
        let attribute = someAttribute ~ priority
        
        XCTAssertEqual(attribute.priority, priority, "We should be able to set the attribute priority")
    }
    
    func testEqualOperatorBetweenTwoLayoutAttributes() {
        
        let attributeOne = AutoLayoutAttribute(type: .Top, view: UIView())
        let attributeTwo = AutoLayoutAttribute(type: .Top, view: UIView())
        
        let constraint = attributeOne == attributeTwo
        
        XCTAssert(constraint.relation == .Equal, "The constraint relation should be set to Equal")
    }
    
    func testEqualOperatorWithNumber() {
        
        let attribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let constraint = attribute == 200
        
        XCTAssert(constraint.constant == 200, "We should be able to set the attribute constant")
    }
    
    func testGreaterThanOrEqualOperatorBetweenTwoLayoutAttributes() {
        
        let attributeOne = AutoLayoutAttribute(type: .Width, view: UIView())
        let attributeTwo = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let constraint = attributeOne >= attributeTwo
        
        XCTAssert(constraint.relation == .GreaterThanOrEqual, "The constraint relation should be set to GreaterThanOrEqual")
    }
    
    func testGreaterThanOrEqualOperatorWithNumber() {
        
        let attribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let constraint = attribute >= 200
        
        XCTAssert(constraint.relation == .GreaterThanOrEqual, "The constraint relation should be set to GreaterThanOrEqual")
        XCTAssert(constraint.constant == 200, "The constraint constant should match the attribute constant")
    }
    
    func testLessThanOrEqualOperatorBetweenTwoLayoutAttributes() {
        
        let attributeOne = AutoLayoutAttribute(type: .Width, view: UIView())
        let attributeTwo = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let constraint = attributeOne <= attributeTwo
        
        XCTAssert(constraint.relation == .LessThanOrEqual, "The constraint relation should be set to LessThanOrEqual")
    }
    
    func testLessThanOrEqualOperatorWithNumber() {
        
        let attribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let constraint = attribute <= 200
        
        XCTAssert(constraint.relation == .LessThanOrEqual, "The constraint relation should be set to LessThanOrEqual")
        XCTAssert(constraint.constant == 200, "The constraint constant should match the attribute constant")
    }
    
    func testAdditionOperator() {
        
        let someAttribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let attribute = someAttribute + 200
        
        XCTAssert(attribute.constant == 200, "We sould be able to add a number to the attribute constant")
    }
    
    func testSubtractionOperator() {
        
        let someAttribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let attribute = someAttribute - 200
        
        XCTAssert(attribute.constant == -200, "We should be able to substract a number from the attribute constant")
    }
    
    func testMultiplicationOperator() {
        
        let someAttribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let attribute = someAttribute * 2
        
        XCTAssert(attribute.multiplier == 2, "We should be able to set the attribute multiplier value")
    }
    
    func testDivisionOperator() {
        
        let someAttribute = AutoLayoutAttribute(type: .Width, view: UIView())
        
        let attribute = someAttribute / 2
        
        XCTAssert(attribute.multiplier == 0.5, "We should be able to divide the attribute multiplier value")
    }
}
