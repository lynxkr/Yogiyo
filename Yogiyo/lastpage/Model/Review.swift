//
//  Review.swift
//  TableViewYogiyo
//
//  Created by 김지훈 on 10/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

typealias Review = [ReviewElement]

struct ReviewElement: Codable {
    let id: Int
    let comment, rating, ratingDelivery, ratingQuantity: String
    let ratingTaste: String
    let reviewImages: JSONNull?
    let time: String
    let user: User
}

struct User: Codable {
    let id: Int
    let username: Username
    let email: String
}

enum Username: String, Codable {
    case admin = "admin"
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
