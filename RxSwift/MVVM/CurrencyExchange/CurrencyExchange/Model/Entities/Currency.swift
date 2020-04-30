//
//  Currency.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/23/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import Foundation
struct Currency: Codable {
    let rates: [String: Double]
    let base, date: String
}
