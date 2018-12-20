//
//  TitleInfoView.swift
//  TableViewYogiyo
//
//  Created by Kira on 28/11/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class TitleInfoView: UIView {
    
    var storeTitle: String?
    var mark: Int?
    var interval: String?
    var discount: String?
    
    
    var storeTitleLabel = UILabel()
    var ratingStarView = RatingStarView()
    var ratingLabel = UILabel()
    var intervalLabel = UILabel()
    var discountLabel = UILabel()
    
    
    init(frame: CGRect, storeTitle: String, mark: Int, interval: String, discount: String) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.storeTitle = storeTitle
        self.mark = mark
        self.interval = interval
        self.discount = discount
        
        congigure()
        congigureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func dataSet(storeTitle: String, mark: Int, interval: String, discount: String) {
//        self.storeTitle = storeTitle
//        self.mark = mark
//        self.interval = interval
//        self.discount = discount
//    }
    
    private func congigure() {
        storeTitleLabel.text = storeTitle ?? "없음"
        storeTitleLabel.font = UIFont.systemFont(ofSize: 25.0)
        storeTitleLabel.textAlignment = .center
        storeTitleLabel.adjustsFontSizeToFitWidth = true
//        storeTitleLabel.font = storeTitleLabel.font.withSize(40)
        self.addSubview(storeTitleLabel)
        
        self.addSubview(ratingStarView)
        
        ratingLabel.text = String(mark ?? 0)
        ratingLabel.textAlignment = .center
        self.addSubview(ratingLabel)
        
        intervalLabel.text = interval ?? "없음"
        intervalLabel.textAlignment = .center
        intervalLabel.font = UIFont.systemFont(ofSize: 14.0)

        self.addSubview(intervalLabel)
        
        discountLabel.text = discount ?? "없음"
        discountLabel.textAlignment = .center
        discountLabel.font = UIFont.systemFont(ofSize: 14.0)

        self.addSubview(discountLabel)
    }
    
    private struct Standard {
        static let spase: CGFloat = 10
        static let starCenter: CGFloat = 30
    }
    
    private func congigureLayout() {
        storeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        storeTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        storeTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        storeTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        storeTitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        ratingStarView.translatesAutoresizingMaskIntoConstraints = false
        ratingStarView.topAnchor.constraint(equalTo: storeTitleLabel.bottomAnchor).isActive = true
        ratingStarView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -Standard.starCenter).isActive = true
        ratingStarView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ratingStarView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: storeTitleLabel.bottomAnchor).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: ratingStarView.trailingAnchor, constant: -Standard.spase).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        intervalLabel.translatesAutoresizingMaskIntoConstraints = false
        intervalLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor).isActive = true
        intervalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        intervalLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        intervalLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.topAnchor.constraint(equalTo: intervalLabel.bottomAnchor).isActive = true
        discountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        discountLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        discountLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
    }
}
