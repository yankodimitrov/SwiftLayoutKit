//
//  ViewController.swift
//  SwiftLayoutKitExample
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit
import SwiftLayoutKit

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
            label.text = "LayoutKit"
            label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var boxView: UIView = {
        
        let view = UIView()
            view.backgroundColor = UIColor.blueColor()
            view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    ///////////////////////////////////////////////////////
    // MARK: - View
    ///////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(titleLabel)
        view.addSubview(boxView)
        
        setupLayout()
    }
    
    ///////////////////////////////////////////////////////
    // MARK: - Layout
    ///////////////////////////////////////////////////////
    
    private func setupLayout() {
        
        let views : [String : UIView] = ["title": titleLabel]
        
        view +| constraintsWith(format: "|-[title]-|", forViews: views)
        
        view +| titleLabel.attribute(.Top) == view.attribute(.Top) + 30
        view +| boxView.attribute(.Width) == 100
        view +| boxView.attribute(.Height) == 100
        
        view +| constraintsWith(align: .CenterX, toView: view, forViews: boxView)
        view +| constraintsWith(align: .CenterY, toView: view, forViews: boxView)
    }
}
