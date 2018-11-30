//
//  testViewController.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/30/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class CouponVC: UIViewController {

    @IBAction func onMoreTapped() {
        print("more tapped")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)    }

    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToMenu", sender: self)
    }
    

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
}
