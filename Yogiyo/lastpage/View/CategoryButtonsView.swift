//
//  CategoryButtonsView.swift
//  TableViewYogiyo
//
//  Created by Kira on 29/11/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

protocol CategoryButtonsViewDelegate: class {
    func categoryChange(sender: UIButton)
}

class CategoryButtonsView: UIView {
    
    weak var deldgate: CategoryButtonsViewDelegate?
    
    private let menuButton = UIButton()
    private let reviewButton = UIButton()
    private let infoButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        configure()
        configureLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        menuButton.tag = 0
        menuButton.setTitle("메뉴", for: .normal)
        menuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)

        menuButton.setTitleColor(.black, for: .normal)
        menuButton.setTitleColor(.red, for: .selected)
        menuButton.addTarget(self, action: #selector(buttonDidTap(sender:)), for: .touchUpInside)
        self.addSubview(menuButton)
        
        reviewButton.tag = 1
        reviewButton.setTitle("리뷰", for: .normal)
        reviewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)

        reviewButton.setTitleColor(.black, for: .normal)
        reviewButton.setTitleColor(.red, for: .selected)
        reviewButton.addTarget(self, action: #selector(buttonDidTap(sender:)), for: .touchUpInside)
        self.addSubview(reviewButton)
        
        infoButton.tag = 2
        infoButton.setTitle("정보", for: .normal)
        infoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)

        infoButton.setTitleColor(.black, for: .normal)
        infoButton.setTitleColor(.red, for: .selected)
        
        infoButton.addTarget(self, action: #selector(buttonDidTap(sender:)), for: .touchUpInside)
        self.addSubview(infoButton)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func configureLayout() {
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        menuButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        reviewButton.translatesAutoresizingMaskIntoConstraints = false
        reviewButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        reviewButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        reviewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        reviewButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        infoButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    @objc private func buttonDidTap(sender: UIButton) {
        deldgate?.categoryChange(sender: sender)
    }
}
