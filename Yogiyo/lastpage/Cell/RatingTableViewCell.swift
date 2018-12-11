//
//  RatingTableViewCell.swift
//  TableViewYogiyo
//
//  Created by Kira on 05/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    private let centerView = UIView()
    let generalRatingLabel = UILabel()
    let generalRatingStarView = RatingStarView()
    
    var generalRating: CGFloat = 0 {
        didSet {
            generalRatingStarView.rating = generalRating
            configureLayout()
        }
    }
    
    let tasteRatingLabel = UILabel()
    let tasteRatingStarView = RatingStarView()
    
    
    
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
        centerView.backgroundColor = .gray
        self.addSubview(centerView)
        
        generalRatingLabel.textAlignment = .center
        generalRatingLabel.font = generalRatingLabel.font.withSize(30)
        self.addSubview(generalRatingLabel)
        
        self.addSubview(generalRatingStarView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let center: CGFloat = 20
        static let centerTopSpace: CGFloat = 15
        
        static let generalRatingWidth: CGFloat = 100
        static let generalRatingHeight: CGFloat = 60
        
        static let detailRatingWidth: CGFloat = 120
        static let detailRatingheight: CGFloat = 30
    }
    
    private func configureLayout() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.centerTopSpace).isActive = true
        centerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.centerTopSpace).isActive = true
        centerView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -Standard.center).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        generalRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        generalRatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        generalRatingLabel.trailingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: -Standard.space).isActive = true
        generalRatingLabel.widthAnchor.constraint(equalToConstant: Standard.generalRatingWidth).isActive = true
        generalRatingLabel.heightAnchor.constraint(equalToConstant: Standard.generalRatingHeight).isActive = true
        
        generalRatingStarView.translatesAutoresizingMaskIntoConstraints = false
        generalRatingStarView.trailingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: -Standard.space).isActive = true
        generalRatingStarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        generalRatingStarView.widthAnchor.constraint(equalToConstant: Standard.generalRatingWidth).isActive = true
        generalRatingStarView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
