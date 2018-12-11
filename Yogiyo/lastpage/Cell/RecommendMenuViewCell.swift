//
//  InfoTableViewCell.swift
//  TableViewYogiyo
//
//  Created by Kira on 04/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class RecommendMenuViewCell: UITableViewCell {
    var recommendViews: [RecommendMenuView]?
    
    var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let recommendViews = recommendViews {
            recommendViews.forEach {scrollView.addSubview($0) }
            recommendViewsLayout(views: recommendViews)
        }
        
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
        self.addSubview(scrollView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let recommendMenuViewWdith: CGFloat = 130
    }
    
    private func configureLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    private func recommendViewsLayout(views: [RecommendMenuView]) {
        for index in 0..<views.count {
            switch index {
            case 0:
                views[0].topAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.topAnchor, constant: Standard.space).isActive = true
                views[0].bottomAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
                views[0].leadingAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: Standard.space).isActive = true
                views[0].widthAnchor.constraint(equalToConstant: Standard.recommendMenuViewWdith).isActive = true
                views[0].heightAnchor.constraint(
                    equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -(Standard.space * 2)).isActive = true
            case views.count - 1:
                views[views.count - 1].topAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.topAnchor, constant: Standard.space).isActive = true
                views[views.count - 1].leadingAnchor.constraint(
                    equalTo: views[views.count - 2].trailingAnchor, constant: Standard.space).isActive = true
                views[views.count - 1].trailingAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -Standard.space).isActive = true
                views[views.count - 1].bottomAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
                views[views.count - 1].widthAnchor.constraint(equalToConstant: Standard.recommendMenuViewWdith).isActive = true
                views[views.count - 1].heightAnchor.constraint(
                    equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -(Standard.space * 2)).isActive = true
            default :
                views[index].topAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.topAnchor, constant: Standard.space).isActive = true
                views[index].bottomAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
                views[index].leadingAnchor.constraint(
                    equalTo: views[index - 1].trailingAnchor, constant: Standard.space).isActive = true
                views[index].widthAnchor.constraint(equalToConstant: Standard.recommendMenuViewWdith).isActive = true
                views[index].heightAnchor.constraint(
                    equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -(Standard.space * 2)).isActive = true
            }
        }
    }}
