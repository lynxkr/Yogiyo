//
//  UserReviewTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 17/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class UserReviewTableViewCell: UITableViewCell {
    let userImageView = UIImageView(image: UIImage(named: "user"))
    let userIdLabel = UILabel()
    let timeLabel = UILabel()
    let ratingStarView = RatingStarView()
    let otherRatingLabel = UILabel()
    let commentLabel = UILabel()
    
    private let tempView = UIView()
    
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
        self.addSubview(userImageView)
        self.addSubview(userIdLabel)
        self.addSubview(timeLabel)
        self.addSubview(ratingStarView)
        tempView.backgroundColor = .gray
        self.addSubview(tempView)
        otherRatingLabel.textColor = .gray
        otherRatingLabel.font = otherRatingLabel.font.withSize(15)
        self.addSubview(otherRatingLabel)
        commentLabel.numberOfLines = 0
        self.addSubview(commentLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let userImageViewSize: CGFloat = 50
        
        static let ratingStarViewHeight: CGFloat = 17
        static let ratingStarViewWidth: CGFloat = 80
    }
    
    private func configureLayout() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: Standard.userImageViewSize).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: Standard.userImageViewSize).isActive = true
        
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        userIdLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        userIdLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: userIdLabel.trailingAnchor, constant: Standard.space).isActive = true
        
        ratingStarView.translatesAutoresizingMaskIntoConstraints = false
        ratingStarView.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: Standard.space).isActive = true
        ratingStarView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        ratingStarView.widthAnchor.constraint(equalToConstant: Standard.ratingStarViewWidth).isActive = true
        ratingStarView.heightAnchor.constraint(equalToConstant: Standard.ratingStarViewHeight).isActive = true
        
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 13).isActive = true
        tempView.leadingAnchor.constraint(equalTo: ratingStarView.trailingAnchor, constant: Standard.space ).isActive = true
        tempView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        tempView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        otherRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        otherRatingLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: Standard.space).isActive = true
        otherRatingLabel.leadingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: Standard.space).isActive = true
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: Standard.space).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
    }
}
