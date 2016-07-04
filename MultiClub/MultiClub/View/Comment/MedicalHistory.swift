//
//  MedicalHistory.swift
//  MultiClub
//
//  Created by Admin on 02/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class MedicalHistory: UIView {
    var medical_history:String?
    @IBOutlet var txtView:UITextView?
    class func initView(mHisory:String) ->MedicalHistory{
        let view = NSBundle.mainBundle().loadNibNamed("MedicalHistory", owner: nil, options: nil)[0] as! MedicalHistory
        view.medical_history = mHisory;
        return view
    }
    
    override func awakeFromNib() {
        self.txtView?.layer.borderWidth = 1.0;
        self.txtView?.layer.borderColor = UIColor.lightGrayColor().CGColor;
        self.txtView?.text = self.medical_history
    }

}
