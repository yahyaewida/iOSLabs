//
//  Reachability.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/25/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import Foundation
import Alamofire

class Reachability{
    
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
