//
//  RatingTableViewCell.swift
//  TableViewYogiyo
//
//  Created by Kira on 05/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configure() {
        
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let sideSpace: CGFloat = 50
        
        static let generalRatingWidth: CGFloat = 100
        static let detailRatingWidth: CGFloat = 120
    }
    
    private func configureLayout() {
        
        
    }
}
