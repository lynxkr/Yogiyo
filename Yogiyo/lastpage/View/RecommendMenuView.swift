//
//  TestView.swift
//  TableViewYogiyo
//
//  Created by Kira on 04/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

protocol RecommendMenuViewDelegate: class {
    func tempButtonDidTap(view: UIView)
}

class RecommendMenuView: UIView {
    weak var delegate: RecommendMenuViewDelegate?
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let tempButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(imageView)
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14.0)

        self.addSubview(nameLabel)
        
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 14.0)

        self.addSubview(priceLabel)
        
        tempButton.setTitleColor(.clear, for: .normal)
        tempButton.addTarget(self, action: #selector(tempButtonAction), for: .touchUpInside)
        self.addSubview(tempButton)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let imageViewMultiplier: CGFloat = 0.7
        static let nameLabelMultiplier: CGFloat = 0.15
        static let priceLabelMultiplier: CGFloat = 0.15
    }
    
    private func configureLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Standard.imageViewMultiplier).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Standard.nameLabelMultiplier).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Standard.priceLabelMultiplier).isActive = true
        
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tempButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tempButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tempButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    @objc private func tempButtonAction(sender: UIButton) {
        delegate?.tempButtonDidTap(view: self)
    }
}
