//
//  FoodlistElement.swift
//  Yogiyo
//
//  Created by 김지훈 on 04/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//


// To parse the JSON, add this file to your project and do:
//
//   let foodlist = try? newJSONDecoder().decode(Foodlist.self, from: jsonData)


import Foundation

typealias Foodlist = [FoodlistElement]

struct FoodlistElement: Codable {
    let id: Int
    let name: String
    let logoURL: String
    let reviewAvg: String
    let minOrderAmount, reviewCount, ownerReplyCount: Int
    let exceptCash: Bool
    let paymentMethods: [Category]
    let discountPercent: Int
    let estimatedDeliveryTime: String
    let additionalDiscountPerMenu: Int
    let tags, categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoURL = "logoUrl"
        case reviewAvg, minOrderAmount, reviewCount, ownerReplyCount, exceptCash, paymentMethods, discountPercent, estimatedDeliveryTime, additionalDiscountPerMenu, tags, categories
    }
}

struct Category: Codable {
    let id: Int
    let name: String
}
