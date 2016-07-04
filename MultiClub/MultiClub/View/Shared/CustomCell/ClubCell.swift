//
//  ClubCell.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ClubCell: UITableViewCell {
    @IBOutlet var lblClubName:UILabel?;
    @IBOutlet var lblClubDesc:UILabel?;
    @IBOutlet var lblStartDate:UILabel?;
    @IBOutlet var lblStartTime:UILabel?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
