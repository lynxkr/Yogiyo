//
//  CartViewController.swift
//  Yogiyo
//
//  Created by 김지훈 on 18/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBAction func payButtonClicked(_ sender: Any) {
        SettingData.shared.cartMenu = [""]
        SettingData.shared.cartPrice = [0]
    }
    @IBAction func creditButtonClick(_ sender: UIButton) {
        print(1)
        sender.layer.borderColor = UIColor.red.cgColor
              cashButton.layer.borderColor = UIColor.black.cgColor
    }
    @IBAction func cashButtonClick(_ sender: UIButton) {
             sender.layer.borderColor = UIColor.red.cgColor
              creditButton.layer.borderColor = UIColor.black.cgColor
    }
    @IBOutlet var menuLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var cashButton: UIButton!
    @IBOutlet var creditButton: UIButton!
    override func viewDidLoad() {
        let price = SettingData.shared.cartPrice[1]
        super.viewDidLoad()
        buttonSetting()
        priceLabel.text = "\(price)원"
        menuLabel.text = SettingData.shared.cartMenu[1]
        addressLabel.text = SettingData.shared.location!
        // Do any additional setup after loading the view.
    }
    func buttonSetting(){
      
        cashButton.layer.borderColor = UIColor.black.cgColor
        cashButton.layer.borderWidth = 1
    
        creditButton.layer.borderColor = UIColor.black.cgColor
        creditButton.layer.borderWidth = 1
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
