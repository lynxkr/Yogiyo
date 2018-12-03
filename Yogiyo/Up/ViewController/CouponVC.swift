//
//  testViewController.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/30/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class CouponVC: UIViewController {

    @IBOutlet weak var NavBar: UINavigationBar!
    @IBAction func onMoreTapped() {
        print("more tapped")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)    }

    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToMenu", sender: self)
    }
    

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)]
        let height: CGFloat = 50
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)


    }
}
