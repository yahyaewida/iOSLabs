//
//  NetworkRequestHandler.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/23/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift
class NetworkRequestHandler {
      
    func fetchData <T: Codable>(url: String)->Observable<[T]>{
    let observable = Observable<[T]>.create{(observer) in
       AF.request(url)
        .validate()
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    let objectParser = ObjectParser<T>()
                    let array = objectParser.parseObject(jsonData: response.data!)
                     
                    observer.onNext(array ?? [])
                    
                default:
                    observer.onError(NSError(domain: "Error in fetching data", code: 0, userInfo: [:]))
                }
        }
        return Disposables.create()
    }
        return observable
}
}
