//
//  MemberCell.swift
//  MultiClub
//
//  Created by Admin on 13/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {

    @IBOutlet var lblMembername:UILabel?;
    @IBOutlet var btnArrivr:UIButton?;
    @IBOutlet var btnComment:UIButton!;
    @IBOutlet var btnAddMember:UIButton?;
    @IBOutlet var btnLeft:UIButton?;
    @IBOutlet var btnAgreedToPhotoAndVideos:UIButton?;
    @IBOutlet var btnMedicalHistory:UIButton?;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnCommentClicked(sender:UIButton){
//         KGModal.sharedInstance().responsiveToKeyboard = true;
//        let view = CommentView.initView();
//        KGModal.sharedInstance().showWithContentView(view)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
