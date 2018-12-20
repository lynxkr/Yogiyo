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
    let menuSummary: [JSONAny]
    let restaurant: Int
    var otherRating: String {
        return "맛: \(ratingTaste), 양: \(ratingQuantity), 배달: \(ratingDelivery)"
    }
    var changeTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSSSSZZZZZZ"
        print(time)
        if let date = formatter.date(from: time) {
            print("date", date)
            let now = Date()
            let interval = now.timeIntervalSince(date)
            if interval < 86400 {
                return "\(Int(interval/3600)) 시간 전"
            } else {
                formatter.dateFormat = "yyyy-MM-dd"
                return formatter.string(from: date)
            }
            
        } else {
            print("fail")
          return ""
        }
    }
}

struct User: Codable {
    let id: Int
    let username, email: String
    let phoneNumber: JSONNull?
    let nickName: String
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
