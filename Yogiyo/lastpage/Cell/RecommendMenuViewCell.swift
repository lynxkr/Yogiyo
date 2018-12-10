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
    var recommendMenuData: [recommendMenu]?
    
    var datacount = 0
    
    var recommendMenuScrollView : UIScrollView = {
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
        print(datacount)
        if let data = recommendMenuData, datacount < 2 {
            datacount += 1
            createRecommendMenuView(count: data.count)
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
        self.addSubview(recommendMenuScrollView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let recommendMenuViewWdith: CGFloat = 130
    }
    
    private func configureLayout() {
        recommendMenuScrollView.translatesAutoresizingMaskIntoConstraints = false
        recommendMenuScrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        recommendMenuScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        recommendMenuScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        recommendMenuScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    var recommendMenuViews: [RecommendMenuView] = []
    let testColor: [UIColor] = [.red, .blue, .yellow, .black, .darkGray]
    
    func createRecommendMenuView(count: Int) {
        for index in 0..<count {
            let tempRecommentMenuView = RecommendMenuView()
            let url = recommendMenuData?[index].image
            print(url)
            
            //                    let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            Alamofire.request(url!).responseImage { response in
                switch response.result {
                case .success(_): if let image = response.result.value {
                    let img = image
                    
                    //                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    tempRecommentMenuView.imageView.image = img
                    tempRecommentMenuView.imageView.clipsToBounds = true
                    tempRecommentMenuView.imageView.layer.cornerRadius = tempRecommentMenuView.imageView.frame.width / 2
                    tempRecommentMenuView.imageView.contentMode = .scaleAspectFit
                    //                            }
                    
                    }
                case .failure(let err) : print("에러: \(err)")
                }
            }
//            tempRecommentMenuView.imageView.image = recommendMenuData![index].image
            tempRecommentMenuView.nameLabel.text = recommendMenuData![index].name
            tempRecommentMenuView.priceLabel.text = String(recommendMenuData![index].price)
            tempRecommentMenuView.translatesAutoresizingMaskIntoConstraints = false
            recommendMenuScrollView.addSubview(tempRecommentMenuView)
            recommendMenuViews.append(tempRecommentMenuView)
            
            switch index {
            case 0:
                recommendMenuViews[0].topAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.topAnchor, constant: Standard.space).isActive = true
                recommendMenuViews[0].bottomAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
                recommendMenuViews[0].leadingAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.leadingAnchor, constant: Standard.space).isActive = true
                recommendMenuViews[0].widthAnchor.constraint(equalToConstant: Standard.recommendMenuViewWdith).isActive = true
                recommendMenuViews[0].heightAnchor.constraint(
                    equalTo: recommendMenuScrollView.frameLayoutGuide.heightAnchor, constant: -(Standard.space * 2)).isActive = true
            case count - 1:
                recommendMenuViews[count - 1].topAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.topAnchor, constant: Standard.space).isActive = true
                recommendMenuViews[count - 1].leadingAnchor.constraint(
                    equalTo: recommendMenuViews[count - 2].trailingAnchor, constant: Standard.space).isActive = true
                recommendMenuViews[count - 1].trailingAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.trailingAnchor, constant: -Standard.space).isActive = true
                recommendMenuViews[count - 1].bottomAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
                recommendMenuViews[count - 1].widthAnchor.constraint(equalToConstant: Standard.recommendMenuViewWdith).isActive = true
                recommendMenuViews[count - 1].heightAnchor.constraint(
                    equalTo: recommendMenuScrollView.frameLayoutGuide.heightAnchor, constant: -(Standard.space * 2)).isActive = true
            default :
                recommendMenuViews[index].topAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.topAnchor, constant: Standard.space).isActive = true
                recommendMenuViews[index].bottomAnchor.constraint(
                    equalTo: recommendMenuScrollView.contentLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
                recommendMenuViews[index].leadingAnchor.constraint(
                    equalTo: recommendMenuViews[index - 1].trailingAnchor, constant: Standard.space).isActive = true
                recommendMenuViews[index].widthAnchor.constraint(equalToConstant: Standard.recommendMenuViewWdith).isActive = true
                recommendMenuViews[index].heightAnchor.constraint(
                    equalTo: recommendMenuScrollView.frameLayoutGuide.heightAnchor, constant: -(Standard.space * 2)).isActive = true
            }
        }
    }
}
