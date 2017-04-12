//
//  CustomTableViewCell.swift
//  FirstIOSApp
//
//  Created by TanMacVbox on 4/11/17.
//  Copyright © 2017 TanMacVbox. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieLabel: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var likeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
