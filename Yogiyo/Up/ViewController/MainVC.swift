//
//  MainVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/27/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
// 은경 뷰

import UIKit

class MainVC: UIViewController {

    //// 요기요 디폴트 홈page
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showLogin), name: NSNotification.Name("showLogin"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showCoupon), name: NSNotification.Name("showCoupon"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showReview), name: NSNotification.Name("showReview"), object: nil)

    }
    
    @objc func showLogin() {
        performSegue(withIdentifier: "showLogin", sender: nil)
    }
    @objc func showCoupon() {
        performSegue(withIdentifier: "showCoupon", sender: nil)
    }
    @objc func showReview() {
        performSegue(withIdentifier: "showReview", sender: nil)
    }
    
    
    //need this for menu
    @IBAction func onMenuTapped() {
        print("toggle side menu")
        NotificationCenter.default.post(name: NSNotification.Name("toggleSideMenu"), object: nil)
    }


}
