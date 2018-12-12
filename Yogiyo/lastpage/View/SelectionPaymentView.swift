//
//  SectionPaymentView.swift
//  Yogiyo
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

protocol SelectionPaymentViewDelegate: class {
    func buttonDidTap(sender: UIButton)
}

class SelectionPaymentView: UIView {
    weak var delegate: SelectionPaymentViewDelegate?
    
    private let billButton = UIButton()
    private let orderButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        billButton.setTitle("주문표에 추가", for: .normal)
        billButton.setTitleColor(.white, for: .normal)
        billButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        billButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(billButton)
        
        orderButton.setTitle("주문하기", for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        orderButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(orderButton)
    }
    
    private func configureLayout() {
        billButton.translatesAutoresizingMaskIntoConstraints = false
        billButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        billButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        billButton.trailingAnchor.constraint(equalTo: orderButton.leadingAnchor).isActive = true
        billButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        billButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: billButton.trailingAnchor).isActive = true
        orderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        orderButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    @objc private func buttonAction(sender: UIButton) {
        
        delegate?.buttonDidTap(sender: sender)
    }
    
}
