//
//  CommentView.swift
//  MultiClub
//
//  Created by Admin on 17/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
@objc protocol CommentViewDelegate{
    func submitCommentClicked(comment:String);
 
}
class CommentView: UIView {
    var memberr:Member?
    var event_id:Int?;
    var delegate:CommentViewDelegate?;
    @IBOutlet var txtView:UITextView?
    
    override func awakeFromNib() {
        self.txtView?.layer.borderWidth = 1.0;
        self.txtView?.layer.borderColor = UIColor.lightGrayColor().CGColor;
        self.txtView?.text = memberr?.comment;
    }
    
    class func initView(member:Member,del:CommentViewDelegate) ->CommentView{
        let view = NSBundle.mainBundle().loadNibNamed("CommentView", owner: nil, options: nil)[0] as! CommentView
        view.delegate = del;
        view.memberr = member;
        return view 
    }
    
    
    
    @IBAction func btnSubmit(sender:UIButton){
        delegate?.submitCommentClicked((txtView?.text)!)
        
    }

}
