//
//  RestaurantTableViewCell.swift
//  VirginiaBeach
//
//  Created by Isma Dia on 17/12/2017.
//  Copyright © 2017 Mobyview. All rights reserved.
//

import UIKit
import Firebase

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    
    @IBOutlet weak var restaurantLocationArea: UILabel!
    
    @IBOutlet weak var restaurantDistance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
