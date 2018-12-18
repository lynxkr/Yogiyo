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
        SettingData.shared.cartMenu = [("",0)]
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
    @IBOutlet var menuPriceLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var cashButton: UIButton!
    @IBOutlet var creditButton: UIButton!
    override func viewDidLoad() {
        var price = 0
        for additem in SettingData.shared.cartPrice {
            price += additem
        }
        var addFood = ""
        var pricelist = ""
        super.viewDidLoad()
        buttonSetting()
        priceLabel.text = "\(price)원"
        for (additem,count) in SettingData.shared.cartMenu {
            if additem == "" {
                addFood += "\n"
                continue
            }
            addFood += additem
            addFood += "X\(count)"
            addFood += "\n"
        }
        for additem in SettingData.shared.cartPrice {
            if additem == 0 {
                pricelist += "\n"
                continue
            }
            pricelist += "\(additem)원"
            pricelist += "\n"
        }
        menuPriceLabel.numberOfLines = 0
        menuPriceLabel.text = pricelist
        
        addressLabel.text = SettingData.shared.location!
        menuLabel.numberOfLines = 0
        menuLabel.text = addFood
        // Do any additional setup after loading the view.
    }
    func buttonSetting(){
      
        cashButton.layer.borderColor = UIColor.black.cgColor
        cashButton.layer.borderWidth = 1
        cashButton.addTarget(self, action: #selector(didButtonCashTap), for: .touchUpInside)
        creditButton.layer.borderColor = UIColor.black.cgColor
        creditButton.layer.borderWidth = 1
        creditButton.addTarget(self, action: #selector(didButtonCreditTap), for: .touchUpInside)
    }

    

@objc func didButtonCashTap(){
    cashButton.layer.borderColor = UIColor.red.cgColor
    creditButton.layer.borderColor = UIColor.black.cgColor
}
@objc func didButtonCreditTap(){
    cashButton.layer.borderColor = UIColor.black.cgColor
    creditButton.layer.borderColor = UIColor.red.cgColor
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
