//
//  SelectionAmountTableViewCell.swift
//  Yogiyo
//
//  Created by Kira on 18/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit


protocol SelectionAmountTableViewCellDelegate: class {
    func amonutButtonDidTap(count: Int)
}

class SelectionAmountTableViewCell: UITableViewCell {
    weak var delegate: SelectionAmountTableViewCellDelegate?
    
    private let titleLabel = UILabel()
    private let minusButton = UIButton()
    let amountLabel = UILabel()
    private let plusButton = UIButton()
    
    private var count: Int = 1
    
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
        titleLabel.text = "수량"
        self.addSubview(titleLabel)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .gray
        minusButton.tag = 0
        minusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(minusButton)
        
        amountLabel.text = "\(count)"
        amountLabel.textAlignment = .center
        amountLabel.backgroundColor = .gray
        self.addSubview(amountLabel)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .gray
        plusButton.tag = 1
        plusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(plusButton)
    }
    
    private struct Standard {
        static let space: CGFloat = 20
        static let buttonWidth: CGFloat = 50
    }
    
    private func configureLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        minusButton.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: Standard.buttonWidth).isActive = true
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: Standard.buttonWidth).isActive = true
    }
    
    @objc private func buttonAction(sender: UIButton) {
        if sender.tag == 0 {
            guard count > 0 else { return }
            count -= 1
            amountLabel.text = "\(count)"
            delegate?.amonutButtonDidTap(count: count)
        } else {
            guard count > -1 else { return }
            count += 1
            amountLabel.text = "\(count)"
            delegate?.amonutButtonDidTap(count: count)
        }
    }
}
