//
//  PaymentView.swift
//  TableViewYogiyo
//
//  Created by Kira on 28/11/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class PaymentView: UIView {
    
     let callButton = UIButton()
     let touchButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        callButton.setTitle("전화주문", for: .normal)
        callButton.setTitleColor(.white, for: .normal)
        callButton.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        callButton.tag = 0
        self.addSubview(callButton)
        
        touchButton.setTitle("터치주문", for: .normal)
        touchButton.setTitleColor(.white, for: .normal)
        touchButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        touchButton.tag = 1
        self.addSubview(touchButton)
    }
    
    private struct Standard {
        
    }
    
    private func configureLayout() {
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        callButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        callButton.trailingAnchor.constraint(equalTo: touchButton.leadingAnchor).isActive = true
        callButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        callButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        touchButton.translatesAutoresizingMaskIntoConstraints = false
        touchButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        touchButton.leadingAnchor.constraint(equalTo: callButton.trailingAnchor).isActive = true
        touchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        touchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        touchButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
    }
    
  
    
}
