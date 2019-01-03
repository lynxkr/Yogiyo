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
    let minOrderAmount, reviewCount, ownerReplyCount: Int
    let exceptCash: Bool
    let paymentMethods: [Category]
    let discountPercent, additionalDiscountPerMenu, deliveryFee: Int
    let estimatedDeliveryTime: EstimatedDeliveryTime
    let tags, categories: [Category]
    let begin, end, companyName, companyNumber: String
    let countryOrigin, introductionText, location: String
    let reviewAvg, ratingDeliveryAvg, ratingQuantityAvg, ratingTasteAvg: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoURL = "logo_url"
        case minOrderAmount = "min_order_amount"
        case reviewCount = "review_count"
        case ownerReplyCount = "owner_reply_count"
        case exceptCash = "except_cash"
        case paymentMethods = "payment_methods"
        case discountPercent = "discount_percent"
        case additionalDiscountPerMenu = "additional_discount_per_menu"
        case deliveryFee = "delivery_fee"
        case estimatedDeliveryTime = "estimated_delivery_time"
        case tags, categories, begin, end
        case companyName = "company_name"
        case companyNumber = "company_number"
        case countryOrigin = "country_origin"
        case introductionText = "introduction_text"
        case location
        case reviewAvg = "review_avg"
        case ratingDeliveryAvg = "rating_delivery_avg"
        case ratingQuantityAvg = "rating_quantity_avg"
        case ratingTasteAvg = "rating_taste_avg"
    }
}



enum EstimatedDeliveryTime: String, Codable {
    case empty = ""
    case the1020분 = "10~20분"
    case the1525분 = "15~25분"
    case the2030분 = "20~30분"
    case the2535분 = "25~35분"
    case the3040분 = "30~40분"
    case the3545분 = "35~45분"
    case the4050분 = "40~50분"
    case the4555분 = "45~55분"
    case the5060분 = "50~60분"
    case the5565분 = "55~65분"
    case the6070분 = "60~70분"
    case the7080분 = "70~80분"
    case the7585분 = "75~85분"
}
