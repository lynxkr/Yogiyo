//
//  testViewController.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/30/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
    @IBAction func onMoreTapped() {
        print("more tapped")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    

}
