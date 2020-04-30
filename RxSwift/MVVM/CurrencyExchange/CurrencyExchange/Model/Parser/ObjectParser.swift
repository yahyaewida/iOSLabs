//
//  ObjectMapper.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/23/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import Foundation

class ObjectParser<T : Codable> {
    func parseObject(jsonData :Data) -> [T]?{
        var result  = [T]()
        do{
            result.append( try JSONDecoder().decode(T.self, from: jsonData))
            
            print(type(of: result))
        }catch{
            print(error)
        }
        return result as? [T]
    }
}
