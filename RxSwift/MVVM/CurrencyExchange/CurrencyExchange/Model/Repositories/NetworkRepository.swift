//
//  NetworkRepository.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/23/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import Foundation
import RxSwift

class NetworkRepository{
    
    
   func getCurrency<T: Codable>()->Observable<[T]>?{
           if Reachability.isConnectedToInternet {
            let observable: Observable<[T]> = NetworkRequestHandler().fetchData(url: apiURL)
               return observable
           }else{
            // in case of error return nil
               return nil
           }
       }
        
}

