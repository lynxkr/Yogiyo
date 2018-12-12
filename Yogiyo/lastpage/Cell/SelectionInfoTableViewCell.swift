//
//  SelectionInfoTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class SelectionInfoTableViewCell: UITableViewCell {
    let menuImageView = UIImageView()
    let titleLabel = UILabel()
    
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
        menuImageView.clipsToBounds = true
        menuImageView.contentMode = .scaleAspectFill
        self.addSubview(menuImageView)
        
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let menuImageViewHeight: CGFloat = 200
        static let titleLabelHeight: CGFloat = 50
    }
    
    private func configureLayout() {
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        menuImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        menuImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        menuImageView.heightAnchor.constraint(equalToConstant: Standard.menuImageViewHeight).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: Standard.titleLabelHeight).isActive = true
    }
}
