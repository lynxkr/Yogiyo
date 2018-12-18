//
//  DetailInfoTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 18/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class DetailInfoTableViewCell: UITableViewCell {
    let detailLabel = UILabel()
    
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
        detailLabel.numberOfLines = 0
        self.addSubview(detailLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func configureLayout() {
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
    }
}
