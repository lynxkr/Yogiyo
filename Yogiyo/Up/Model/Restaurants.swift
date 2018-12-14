//
//  Restaurant.swift
//  Yogiyo
//
//  Created by EunKyung Park on 12/13/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class Restaurants: Codable {
    
    let id: Int
    let name: String
    let logo_url: String
    let review_avg: String
    let min_order_amount: Int
    let review_count: Int
    let payment: Bool

    
    init(id: Int, name: String, logo_url: String, review_avg: String, min_order_amount: Int, review_count: Int, payment: Bool) {
        self.id = id
        self.name = name
        self.logo_url = logo_url
        self.review_avg = review_avg
        self.min_order_amount = min_order_amount
        self.review_count = review_count
        self.payment = payment
   
        
    }
    
}
