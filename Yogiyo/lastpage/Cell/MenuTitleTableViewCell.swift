//
//  MenuTitleTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 11/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class MenuTitleTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let arrowImageView = UIImageView()
    
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
        self.addSubview(titleLabel)
        self.addSubview(arrowImageView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let arrowImageViewWidth: CGFloat = 20
    }
    
    private func configureLayout() {
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        arrowImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: Standard.arrowImageViewWidth).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -Standard.arrowImageViewWidth).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
    }
    
    
}
