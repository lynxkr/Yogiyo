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
    let reviewAvg: Float?
    let minOrderAmount, reviewCount, ownerReplyCount: Int
    let exceptCash: Bool
    let paymentMethods: [Category]
    let discountPercent, additionalDiscountPerMenu, deliveryFee: Int
    let estimatedDeliveryTime: String
    let tags, categories: [Category]
    let begin, end, companyName, companyNumber: String
    let countryOrigin: String
    let introductionText, location: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoURL = "logoUrl"
        case reviewAvg, minOrderAmount, reviewCount, ownerReplyCount, exceptCash, paymentMethods, discountPercent, additionalDiscountPerMenu, deliveryFee, estimatedDeliveryTime, tags, categories, begin, end, companyName, companyNumber, countryOrigin, introductionText, location
    }
}



enum CountryOrigin: String, Codable {
    case 원산지더미ㅡㅠㅡ = "원산지 더미 ㅡㅠㅡ"
}


