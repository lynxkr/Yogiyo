//
//  SelectionViewController.swift
//  Yogiyo
//
//  Created by Kira on 11/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    private var tableViewData = [MenuCellData]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        configure()
        configureLayout()

    }
    
    private func configure() {
        
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func configureLayout() {}
}
