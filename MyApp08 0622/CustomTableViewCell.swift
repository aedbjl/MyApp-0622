//
//  CustomTableViewCell.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/22.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
