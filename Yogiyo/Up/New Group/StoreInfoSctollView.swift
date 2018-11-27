//
//  StoreInfoSctollView.swift
//  Yogiyo
//
//  Created by Kira on 27/11/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class StoreInfoScrollView: UIScrollView {
    
    //    private let titleImageView = UIImageView()
    let titleImageView = UIView()
    let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), storeTitle: "성수족발", mark: 5, interval: "30-40", discount: "2000")
    
    var guidanceCategoryButtonViewTop: NSLayoutConstraint?
    
    let categoryButtonView = CategoryButtonView()
    let menuView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        configure()
        configureLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        //        titleImageView.image = UIImage(named: "족발")
        //        titleImageView.contentMode = UIView.ContentMode.scaleAspectFit
        //        titleImageView.layer.masksToBounds = true
        //        self.addSubview(titleImageView)
        
        titleImageView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.addSubview(titleImageView)
        
        self.addSubview(titleView)
        
        //        self.addSubview(menuView)
        
        self.addSubview(categoryButtonView)
    }
    
    private struct Standard {
        static let space: CGFloat = 54
        
        static let titleImageViewHeight: CGFloat = 250
        static let categoryButtonViewHeight: CGFloat = 50
        static let categoryTopSapce: CGFloat = 2
    }
    
    private func configureLayout() {
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor).isActive = true
        titleImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: Standard.titleImageViewHeight).isActive = true
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Standard.space).isActive = true
        titleView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Standard.space).isActive = true
        titleView.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor).isActive = true
        
        categoryButtonView.translatesAutoresizingMaskIntoConstraints = false
        // 기본위치
        let defaultCategoryButtonViewTop = categoryButtonView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: Standard.categoryTopSapce)
        defaultCategoryButtonViewTop.priority = .defaultHigh
        defaultCategoryButtonViewTop.isActive = true
        // 스크롤시 y 값의 변화에 따라 navigationcontroller 아래 붙음
        guidanceCategoryButtonViewTop = categoryButtonView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        guidanceCategoryButtonViewTop!.priority = .defaultLow
        guidanceCategoryButtonViewTop!.isActive = true
        
        categoryButtonView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Standard.space).isActive = true
        categoryButtonView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Standard.space).isActive = true
        categoryButtonView.heightAnchor.constraint(equalToConstant: Standard.categoryButtonViewHeight).isActive = true
        
        //        menuView.translatesAutoresizingMaskIntoConstraints = false
        //        menuView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: Standard.space).isActive = true
        //        menuView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        //        menuView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //        menuView.bottomAnchor.constraint(equalTo: self.frameLayoutGuide.bottomAnchor).isActive = true
        
    }
    
}
