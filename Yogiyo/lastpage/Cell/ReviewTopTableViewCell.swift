//
//  ReviewTopTableViewCell.swift
//  TableViewYogiyo
//
//  Created by Kira on 05/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

protocol ReviewTopTableViewCellDelegate: class {
    func photoSwitchValueChageed(sender: Bool)
}

class ReviewTopTableViewCell: UITableViewCell {
    weak var delegete: ReviewTopTableViewCellDelegate?
    
    private let reviewCountLable = UILabel()
    private let photoInfoLable = UILabel()
    private let photoSwitch = UISwitch()
    
    var reviewCount = 0 {
        didSet {
            reviewCountLable.text = "리뷰 \(reviewCount)개"
        }
    }
    
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
        reviewCountLable.textAlignment = .center
        self.addSubview(reviewCountLable)
        
        photoInfoLable.text = "사진리뷰만"
        photoInfoLable.textAlignment = .center
        self.addSubview(photoInfoLable)
        
        photoSwitch.frame = CGRect.zero
        photoSwitch.addTarget(self, action: #selector(photoSwitchValueChanged), for: UIControl.Event.valueChanged)
        self.addSubview(photoSwitch)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let sideSpace: CGFloat = 10
        
        static let photoSwitchWidth: CGFloat = 70
    }
    
    private func configureLayout() {
        reviewCountLable.translatesAutoresizingMaskIntoConstraints = false
        reviewCountLable.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        reviewCountLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.sideSpace).isActive = true
        reviewCountLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
        photoInfoLable.translatesAutoresizingMaskIntoConstraints = false
        photoInfoLable.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        photoInfoLable.trailingAnchor.constraint(equalTo: photoSwitch.leadingAnchor, constant: -Standard.sideSpace).isActive = true
        photoInfoLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
        photoSwitch.translatesAutoresizingMaskIntoConstraints = false
        photoSwitch.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        photoSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.sideSpace).isActive = true
        photoSwitch.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        photoSwitch.widthAnchor.constraint(equalToConstant: Standard.photoSwitchWidth).isActive = true
    }
    
    @objc func photoSwitchValueChanged(sender: UISwitch) {
        delegete?.photoSwitchValueChageed(sender: sender.isOn)
    }
}
