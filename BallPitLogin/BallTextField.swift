//
//  BallTextField.swift
//  BallPitLogin
//
//  Created by Joey on 2/6/16.
//  Copyright © 2016 NelsonJE. All rights reserved.
//

import UIKit

class BallTextField: UIView{
    
    // MARK: Properties
    var textField = UITextField()
    
    // MARK: Inits
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        configureSubviews()
        
        textField.constrainUsing(constraints: [
            Constraint.CenterXToCenterX : (of: self, offset: 0),
            Constraint.CenterYToCenterY : (of: self, offset: 0),
            Constraint.Width : (of: nil, offset: 140),
            Constraint.Height : (of: nil, offset: 100)])
        
        super.updateConstraints()
    }
    
    func configureSubviews(){
        backgroundColor = UIColor.fromHex(0xf6f6f6, alpha: 0.9)
        layer.cornerRadius = 1.0
        layer.cornerRadius = 75
        
        textField.backgroundColor = UIColor.clearColor()
        textField.textAlignment = .Center
        textField.autocapitalizationType = .None
        textField.autocorrectionType = .No
        
        self.addSubview(textField)
    }
}
