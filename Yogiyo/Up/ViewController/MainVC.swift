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
    
    @IBAction func onMoreTapped() {
        print("more tapped")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(showLogin), name: NSNotification.Name("ShowLogin"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showAd), name: NSNotification.Name("ShowAd"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showCoupon), name: NSNotification.Name("ShowCoupon"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showReview), name: NSNotification.Name("ShowReview"), object: nil)

    }
    
    @objc func showLogin() {
        print("login")
    }
    @objc func showCoupon() {
        performSegue(withIdentifier: "ShowCoupon", sender: nil)
    }
    @objc func showReview() {
        performSegue(withIdentifier: "ShowReview", sender: nil)
    }

    @objc func showAd() {
        performSegue(withIdentifier: "ShowAd", sender: nil)
    }
    
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
    }
    
    //need this for menu
   

}
