//
//  SelectionSumTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 18/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class SelectionSumTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    let sumPriceLabel = UILabel()
    private let noticeLabel = UILabel()
    
    var price: Int = 0 {
        didSet {
            sumPriceLabel.text = "\(price)"
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
        titleLabel.text = "총 주문금액"
        self.addSubview(titleLabel)
        
        sumPriceLabel.font = sumPriceLabel.font.withSize(30)
        sumPriceLabel.textColor = .red
        self.addSubview(sumPriceLabel)
        
        noticeLabel.font = noticeLabel.font.withSize(15)
        self.addSubview(noticeLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 20
    }
    
    private func configureLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
        sumPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        sumPriceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        sumPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        
        noticeLabel.translatesAutoresizingMaskIntoConstraints = false
        noticeLabel.topAnchor.constraint(equalTo: sumPriceLabel.bottomAnchor).isActive = true
        noticeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        noticeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
    }
}
