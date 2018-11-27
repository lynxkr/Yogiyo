//
//  eateryVO.swift
//  CustomTabBar
//
//  Created by seunghwan Lee on 26/10/2018.
//  Copyright © 2018 seunghwan Lee. All rights reserved.
//

import Foundation

struct eateryVO: Codable {
    let data: resType
    struct resType: Codable {
        let restaurant: [list]
        let cafe: [list]
        let pub: [list]
        
        struct list: Codable {
            let name: String
            let rating: String
            let tag: String
            let followers: String
            let foodImage: [String]
        }
    }
}
