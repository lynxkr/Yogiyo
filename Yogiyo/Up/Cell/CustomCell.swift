//
//  CustomCell.swift
//  CustomTabBar
//
//  Created by seunghwan Lee on 28/10/2018.
//  Copyright © 2018 seunghwan Lee. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
