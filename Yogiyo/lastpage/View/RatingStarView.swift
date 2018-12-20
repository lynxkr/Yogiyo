//
//  RatingStartView.swift
//  Yogiyo
//
//  Created by Kira on 11/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class RatingStarView: UIView {
    let colorView = UIView()
    let starImageView = UIImageView()
    
    var constraint: NSLayoutConstraint?
    
    var rating: CGFloat = 0 {
        didSet {
            layout(rating: rating)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        colorView.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 2/255, alpha: 1)
        self.addSubview(colorView)
        
        let starImage = UIImage(named: "star")
        starImageView.image = starImage
        self.addSubview(starImageView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func configureLayout() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func layout(rating: CGFloat) {
        if constraint != nil {
            constraint?.isActive = false
        }
        constraint = colorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: (rating * 2)  / 10)
        constraint?.isActive = true
    }
}
