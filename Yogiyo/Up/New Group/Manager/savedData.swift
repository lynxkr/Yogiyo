//
//  savedData.swift
//  Yogiyo
//
//  Created by 김지훈 on 14/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import Foundation
struct SettingData {
    static var shared = SettingData()
    var latitude: Double?
    var longitude: Double?
    
    private init() { }
}