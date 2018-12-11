//
//  HeaderView.swift
//  TableViewYogiyo
//
//  Created by Kira on 28/11/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    var titleImageView = TitleImageView(frame: CGRect.zero)
    let titleInfoView = TitleInfoView(frame: CGRect.zero, storeTitle: "", mark: 0, interval: "", discount: "")
    
    var guidanceCategoryButtonViewTop: NSLayoutConstraint?
    let categoryButtonsView = CategoryButtonsView()
    
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
        self.addSubview(titleImageView)
        self.addSubview(titleInfoView)
        self.addSubview(categoryButtonsView)
    }
    
    private struct Standard {
        static let space: CGFloat = 30
        
        static let titleImageViewHeight: CGFloat = 250
        static let titleInfoViewHeight: CGFloat = 100
        static let categoryButtonsViewHeight: CGFloat = 50
        static let categoryButtonsViewTopSapce: CGFloat = 2
        
    }
    
    private func configureLayout() {
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: Standard.titleImageViewHeight).isActive = true

        titleInfoView.translatesAutoresizingMaskIntoConstraints = false
        titleInfoView.leadingAnchor.constraint(equalTo: titleImageView.leadingAnchor, constant: Standard.space).isActive = true
        titleInfoView.trailingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: -Standard.space).isActive = true
        titleInfoView.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor).isActive = true
        titleInfoView.heightAnchor.constraint(equalToConstant: Standard.titleInfoViewHeight).isActive = true
        
        categoryButtonsView.translatesAutoresizingMaskIntoConstraints = false
//        // 기본위치
//        let defaultCategoryButtonViewTop = categoryButtonsView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: Standard.categoryButtonsViewTopSapce)
//        defaultCategoryButtonViewTop.priority = .defaultHigh
//        defaultCategoryButtonViewTop.isActive = true
//        // 스크롤시 y 값의 변화에 따라 navigationcontroller 아래 붙음
//        guidanceCategoryButtonViewTop = categoryButtonsView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
//        guidanceCategoryButtonViewTop!.priority = .defaultLow
//        guidanceCategoryButtonViewTop!.isActive = true
        
        categoryButtonsView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: Standard.categoryButtonsViewTopSapce).isActive = true
        categoryButtonsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        categoryButtonsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        categoryButtonsView.heightAnchor.constraint(equalToConstant: Standard.categoryButtonsViewHeight).isActive = true
        
        
    }
    
}
