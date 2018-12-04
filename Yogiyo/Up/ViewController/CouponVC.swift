//
//  testViewController.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/30/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import Alamofire
import UIKit


class CouponVC: UIViewController {
    var restaurants = [Restaurant]()

    struct Restaurant: Codable {
        
        let id: Int
        let name: String
        let logo_url: String
        let review_avg: Int
        let min_order_amount: Int
        let review_count: Int
        let payment: Bool
        let estimated_delivery_time: String
        let additional_discount_per_menu: Int
        let tags: [String]
        
        
    }



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
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Token adb514c18358cc0a90c3d6658ddf29f12a621f65",
            "Accept": "application/json"
        ]
        
        Alamofire.request("https://jogiyo.co.kr/restaurants/api/restaurant/", headers: headers).responseData { response in
            debugPrint(response)
           
            if let jsonData = response.result.value {
                let result = try? JSONDecoder().decode(Foodlist.self, from: jsonData)
                    print(result?.first?.name)
                    print(result?.last?.name)
                
            }
        }
    

    }
    
    
//    func updateRestaurantData(json: json) {
//
//    }
    
    
}

        
