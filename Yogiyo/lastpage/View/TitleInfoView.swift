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
    
    
    private let storeTitleLabel = UILabel()
    private let ratingLabel = UILabel()
    private let intervalLabel = UILabel()
    private let discountLabel = UILabel()
    
    
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
    
    func dataSet(storeTitle: String, mark: Int, interval: String, discount: String) {
        self.storeTitle = storeTitle
        self.mark = mark
        self.interval = interval
        self.discount = discount
    }
    
    private func congigure() {
        storeTitleLabel.text = storeTitle ?? "없음"
        storeTitleLabel.textAlignment = .center
        storeTitleLabel.font = storeTitleLabel.font.withSize(40)
        self.addSubview(storeTitleLabel)
        
        ratingLabel.text = String(mark ?? 0)
        ratingLabel.textAlignment = .center
        self.addSubview(ratingLabel)
        
        intervalLabel.text = interval ?? "없음"
        intervalLabel.textAlignment = .center
        self.addSubview(intervalLabel)
        
        discountLabel.text = discount ?? "없음"
        discountLabel.textAlignment = .center
        self.addSubview(discountLabel)
    }
    
    private func congigureLayout() {
        storeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        storeTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        storeTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        storeTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        storeTitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: storeTitleLabel.bottomAnchor).isActive = true
        ratingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
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
