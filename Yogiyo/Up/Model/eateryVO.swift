//
//  eateryVO.swift
//  CustomTabBar
//
//  Created by seunghwan Lee on 26/10/2018.
//  Copyright © 2018 seunghwan Lee. All rights reserved.
//

import Foundation

struct eateryVO: Codable {
    let id: Int
    let name: String
    let logoUrl: String
    let reviewAvg: Int
    let minOrderAmount: Int
    let reviewCount: Int
    let payment: Bool
    let estimatedDeliveryTime: String
    let additionalDiscountPerMenu: Int
    let tags: [String]
    let categories : [String]
}

