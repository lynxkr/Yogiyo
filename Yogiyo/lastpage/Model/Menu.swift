//
//  Menu.swift
//  TableViewYogiyo
//
//  Created by Kira on 07/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

typealias Menu = [MenuElement]

struct MenuElement: Codable {
    let id: Int
    let name: String
    let food: [Food]
}

struct Food: Codable {
    let id: Int
    let image: String?
    let name: String
    let price: Int
}
