//
//  CustomTableViewCell.swift
//  TableViewDropdownExperiment
//
//  Created by IKRAMUZZAMAN MUNTASIR on 19/2/20.
//  Copyright © 2020 IKRAMUZZAMAN MUNTASIR. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
