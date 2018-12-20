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
        case logoURL = "logoUrl"
        case minOrderAmount, reviewCount, ownerReplyCount, exceptCash, paymentMethods, discountPercent, additionalDiscountPerMenu, deliveryFee, estimatedDeliveryTime, tags, categories, begin, end, companyName, companyNumber, countryOrigin, introductionText, location, reviewAvg, ratingDeliveryAvg, ratingQuantityAvg, ratingTasteAvg
    }
}


enum Name: String, Codable {
    case cesco = "CESCO"
    case creditcard = "creditcard"
    case excellent = "excellent"
    case online = "online"
    case relayo = "relayo"
    case the1인분주문 = "1인분주문"
    case 분식 = "분식"
    case 야식 = "야식"
    case 예약픽업 = "예약픽업"
    case 일식돈까스 = "일식돈까스"
    case 족발보쌈 = "족발보쌈"
    case 중식 = "중식"
    case 치킨 = "치킨"
    case 카페디저트 = "카페디저트"
    case 프랜차이즈 = "프랜차이즈"
    case 피자양식 = "피자양식"
    case 한식 = "한식"
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
    case the7080분 = "70~80분"
}
