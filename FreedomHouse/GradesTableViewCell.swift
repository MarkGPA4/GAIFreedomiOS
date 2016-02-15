//
//  GradesTableViewCell.swift
//  FreedomHouse
//
//  Created by Mark Li  on 2/6/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit

class GradesTableViewCell: UITableViewCell {

    @IBOutlet weak var Grade: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
