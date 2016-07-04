//
//  CustomTextField.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
 @IBDesignable
class CustomTextField: UITextField {

   
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    
    override func awakeFromNib() {
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = UIColor.lightGrayColor().CGColor;
    }
    
    // placeholder position
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , insetX , insetY)
    }
    
    // text position
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , insetX , insetY)
    }
    


}
