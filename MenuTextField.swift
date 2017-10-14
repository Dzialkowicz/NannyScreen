//
//  MenuTextField.swift
//  NannyScreen
//
//  Created by Jakub Sanecki on 27.08.2017.
//  Copyright © 2017 Jakub Sanecki. All rights reserved.
//

import UIKit

//IBDesignable activates live preview for our interface builder
@IBDesignable
class MenuTextField: UITextField {


    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 231/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
