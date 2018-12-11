//
//  MenuTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 11/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    let menuImageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
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
        self.addSubview(menuImageView)
        
        self.addSubview(nameLabel)
        
        self.addSubview(priceLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let menuImageViewWidth: CGFloat = 100
        static let nameLabelHeight: CGFloat = 20
        static let priceLabelHeight: CGFloat = 40
    }
    
    private func configureLayout() {
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        menuImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        menuImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        menuImageView.widthAnchor.constraint(equalToConstant: Standard.menuImageViewWidth).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: menuImageView.leadingAnchor, constant: -Standard.space).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Standard.nameLabelHeight).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: menuImageView.leadingAnchor, constant: -Standard.space).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: Standard.priceLabelHeight).isActive = true
    }
}
