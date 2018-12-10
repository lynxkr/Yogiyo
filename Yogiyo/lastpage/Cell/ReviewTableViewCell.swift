//
//  ReviewTableViewCell.swift
//  TableViewYogiyo
//
//  Created by Kira on 05/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var deliveryLabel: UILabel!
    @IBOutlet var tasteLabel: UILabel!
    @IBOutlet var QuantityLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
