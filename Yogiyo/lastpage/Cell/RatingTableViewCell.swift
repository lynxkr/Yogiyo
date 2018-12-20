//
//  RatingTableViewCell.swift
//  TableViewYogiyo
//
//  Created by Kira on 05/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    let generalRatingLabel = UILabel()
    let generalRatingStarView = RatingStarView()
    
    private let centerView = UIView()
    
    let tasteRatingLabel = UILabel()
    let tasteRatingStarView = RatingStarView()
    let tasteRatingCountLabel = UILabel()
    
    let quantityRatingLabel = UILabel()
    let quantityRatingStarView = RatingStarView()
    let quantityRatingCountLabel = UILabel()
    
    let deliveryRatingLabel = UILabel()
    let deliveryRatingStarView = RatingStarView()
    let deliveryRatingCountLabel = UILabel()
    
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
    
    private struct Font {
        static let fontSize: CGFloat = 15
    }
    
    private func configure() {
        centerView.backgroundColor = .gray
        self.addSubview(centerView)
        
        generalRatingLabel.textAlignment = .center
        generalRatingLabel.font = generalRatingLabel.font.withSize(50)
        self.addSubview(generalRatingLabel)
        
        self.addSubview(generalRatingStarView)
        
        tasteRatingLabel.text = "맛"
        self.addSubview(tasteRatingLabel)
        self.addSubview(tasteRatingStarView)
        tasteRatingCountLabel.textColor = .red
        self.addSubview(tasteRatingCountLabel)
        
        quantityRatingLabel.text = "양"
        self.addSubview(quantityRatingLabel)
        self.addSubview(quantityRatingStarView)
        quantityRatingCountLabel.textColor = .red
        self.addSubview(quantityRatingCountLabel)
        
        deliveryRatingLabel.text = "배달"
        self.addSubview(deliveryRatingLabel)
        self.addSubview(deliveryRatingStarView)
        deliveryRatingCountLabel.textColor = .red
        self.addSubview(deliveryRatingCountLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let center: CGFloat = 20
        static let centerSpace: CGFloat = 30
        static let centerTopSpace: CGFloat = 15
        
        static let generalRatingWidth: CGFloat = 100
        static let generalRatingLabelHeight: CGFloat = 50
        static let generalRatingStarViewHeight: CGFloat = 20
        
        static let otherLabelWidth: CGFloat = 30
        static let otherLabelHeight: CGFloat = 15
        static let otherRatingStarWidth: CGFloat = 80
        static let otherRatingStarHeight: CGFloat = 15
    }
    
    private func configureLayout() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.centerTopSpace).isActive = true
        centerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.centerTopSpace).isActive = true
        centerView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -Standard.center).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        generalRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        generalRatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        generalRatingLabel.trailingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: -Standard.center).isActive = true
        generalRatingLabel.widthAnchor.constraint(equalToConstant: Standard.generalRatingWidth).isActive = true
        generalRatingLabel.heightAnchor.constraint(equalToConstant: Standard.generalRatingLabelHeight).isActive = true
        
        generalRatingStarView.translatesAutoresizingMaskIntoConstraints = false
        generalRatingStarView.trailingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: -Standard.center).isActive = true
        generalRatingStarView.topAnchor.constraint(equalTo: generalRatingLabel.bottomAnchor, constant: 5).isActive = true
        generalRatingStarView.widthAnchor.constraint(equalToConstant: Standard.generalRatingWidth).isActive = true
        generalRatingStarView.heightAnchor.constraint(equalToConstant: Standard.generalRatingStarViewHeight).isActive = true
        
        tasteRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        tasteRatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        tasteRatingLabel.leadingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: Standard.centerSpace).isActive = true
        tasteRatingLabel.widthAnchor.constraint(equalToConstant: Standard.otherLabelWidth).isActive = true
        tasteRatingLabel.heightAnchor.constraint(equalToConstant: Standard.otherLabelHeight).isActive = true
        
        tasteRatingStarView.translatesAutoresizingMaskIntoConstraints = false
        tasteRatingStarView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        tasteRatingStarView.leadingAnchor.constraint(equalTo: tasteRatingLabel.trailingAnchor, constant: Standard.space).isActive = true
        tasteRatingStarView.widthAnchor.constraint(equalToConstant: Standard.otherRatingStarWidth).isActive = true
        tasteRatingStarView.heightAnchor.constraint(equalToConstant: Standard.otherRatingStarHeight).isActive = true
        
        tasteRatingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        tasteRatingCountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        tasteRatingCountLabel.leadingAnchor.constraint(equalTo: tasteRatingStarView.trailingAnchor).isActive = true
        tasteRatingCountLabel.heightAnchor.constraint(equalToConstant: Standard.otherLabelHeight).isActive = true
        
        
        quantityRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityRatingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        quantityRatingLabel.leadingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: Standard.centerSpace).isActive = true
        quantityRatingLabel.widthAnchor.constraint(equalToConstant: Standard.otherLabelWidth).isActive = true
        quantityRatingLabel.heightAnchor.constraint(equalToConstant: Standard.otherLabelHeight).isActive = true
        
        quantityRatingStarView.translatesAutoresizingMaskIntoConstraints = false
        quantityRatingStarView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        quantityRatingStarView.leadingAnchor.constraint(equalTo: quantityRatingLabel.trailingAnchor, constant: Standard.space).isActive = true
        quantityRatingStarView.widthAnchor.constraint(equalToConstant: Standard.otherRatingStarWidth).isActive = true
        quantityRatingStarView.heightAnchor.constraint(equalToConstant: Standard.otherRatingStarHeight).isActive = true
        
        quantityRatingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityRatingCountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        quantityRatingCountLabel.leadingAnchor.constraint(equalTo: quantityRatingStarView.trailingAnchor).isActive = true
        quantityRatingCountLabel.heightAnchor.constraint(equalToConstant: Standard.otherLabelHeight).isActive = true
        
        deliveryRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryRatingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        deliveryRatingLabel.leadingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: Standard.centerSpace).isActive = true
        deliveryRatingLabel.widthAnchor.constraint(equalToConstant: Standard.otherLabelWidth).isActive = true
        deliveryRatingLabel.heightAnchor.constraint(equalToConstant: Standard.otherLabelHeight).isActive = true
        
        deliveryRatingStarView.translatesAutoresizingMaskIntoConstraints = false
        deliveryRatingStarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        deliveryRatingStarView.leadingAnchor.constraint(equalTo: deliveryRatingLabel.trailingAnchor, constant: Standard.space).isActive = true
        deliveryRatingStarView.widthAnchor.constraint(equalToConstant: Standard.otherRatingStarWidth).isActive = true
        deliveryRatingStarView.heightAnchor.constraint(equalToConstant: Standard.otherRatingStarHeight).isActive = true
        
        deliveryRatingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryRatingCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        deliveryRatingCountLabel.leadingAnchor.constraint(equalTo: deliveryRatingStarView.trailingAnchor).isActive = true
        deliveryRatingCountLabel.heightAnchor.constraint(equalToConstant: Standard.otherLabelHeight).isActive = true
        
        
    }
}
