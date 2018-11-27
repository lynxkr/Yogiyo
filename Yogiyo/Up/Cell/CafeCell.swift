//
//  CafeCell.swift
//  CustomTabBar
//
//  Created by seunghwan Lee on 27/10/2018.
//  Copyright © 2018 seunghwan Lee. All rights reserved.
//

import UIKit

class CafeCell: UITableViewCell {

    @IBOutlet weak var imageCollection: UIImageView!
    
    //    @IBOutlet weak var imageCollection: UIScrollView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var friends: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
}
