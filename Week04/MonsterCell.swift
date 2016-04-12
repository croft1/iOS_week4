//
//  MonsterCell.swift
//  Week04
//
//  Created by Alex Bornos on 28/03/2016.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit

class MonsterCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var attackLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
