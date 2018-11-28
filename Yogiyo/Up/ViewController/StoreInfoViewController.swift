//
//  StoreInfoViewController.swift
//  Yogiyo
//
//  Created by Kira on 27/11/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class StoreInfoViewController: UIViewController {
    
    private let storeInfoScrollView = StoreInfoScrollView()
    private let paymentButtonView = PaymentButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        storeInfoScrollView.delegate = self
        
        
        configure()
        configureLayout()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func configure() {
        storeInfoScrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        view.addSubview(storeInfoScrollView)
        
        view.addSubview(paymentButtonView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let paymentButtonViewHeight: CGFloat = 50
    }
    
    private func configureLayout() {
        storeInfoScrollView.translatesAutoresizingMaskIntoConstraints = false
        storeInfoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        storeInfoScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        storeInfoScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        storeInfoScrollView.bottomAnchor.constraint(equalTo: paymentButtonView.topAnchor).isActive = true
        
        paymentButtonView.translatesAutoresizingMaskIntoConstraints = false
        paymentButtonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        paymentButtonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        paymentButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        paymentButtonView.heightAnchor.constraint(equalToConstant: Standard.paymentButtonViewHeight).isActive = true
    }
    
}

extension StoreInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        
        if scrollView.contentOffset.y > 250 {
            storeInfoScrollView.guidanceCategoryButtonViewTop?.priority = UILayoutPriority(999)
        } else {
            storeInfoScrollView.guidanceCategoryButtonViewTop?.priority = .defaultLow
        }
        storeInfoScrollView.layoutIfNeeded()
    }
}

extension StoreInfoViewController: UIScrollViewAccessibilityDelegate {
    
}
