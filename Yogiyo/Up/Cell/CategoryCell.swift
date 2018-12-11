//
//  CollectionViewCell.swift
//  Yogiyo
//
//  Created by EunKyung Park on 12/6/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var categories: String? {
        didSet {
            if let imageName = categories {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    func setup() {
        
        addSubview(imageView)
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
