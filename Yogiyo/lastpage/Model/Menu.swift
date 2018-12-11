//
//  Menu.swift
//  TableViewYogiyo
//
//  Created by Kira on 07/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let menu = try? newJSONDecoder().decode(Menu.self, from: jsonData)

import Foundation

typealias Menu = [MenuElement]

struct MenuElement: Codable {
    let id: Int
    let restaurant: Restaurant
    let name: String
    let food: [Food]
}

struct Food: Codable {
    let id: Int
    let image: String?
    let name: String
    let price: Int
}

struct Restaurant: Codable {
    let id: Int
    let name: String
    let logoURL: String
    let reviewAvg: String
    let minOrderAmount, reviewCount, ownerReplyCount: Int
    let exceptCash: Bool
    let paymentMethods: [Category]
    let discountPercent, additionalDiscountPerMenu, deliveryFee: Int
    let estimatedDeliveryTime: String
    let tags, categories: [Category]
    let begin, end, companyName, companyNumber: String
    let countryOrigin, introductionText: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoURL = "logoUrl"
        case reviewAvg, minOrderAmount, reviewCount, ownerReplyCount, exceptCash, paymentMethods, discountPercent, additionalDiscountPerMenu, deliveryFee, estimatedDeliveryTime, tags, categories, begin, end, companyName, companyNumber, countryOrigin, introductionText
    }
}

struct Category: Codable {
    let id: Int
    let name: String
}

struct MenuCellData {
    var id = Int()
    var opened = Bool()
    var title = String()
    var sectionData = [Food]()
}

