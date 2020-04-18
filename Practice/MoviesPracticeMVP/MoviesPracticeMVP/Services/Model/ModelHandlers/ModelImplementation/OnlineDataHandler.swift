//
//  TableViewExtension.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/26/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit
import CoreData
class OnlineDataHandler : OnlineDataProtocol{
    

     private static var instance = OnlineDataHandler()
     
     var coreDataHandler:CoreDataProtocol?
     var moviesArray :[Movie] = []
    
     private init(){
        coreDataHandler = CoreDataHandler.getCoreHandlerInstance()
     }
     static func getInstance() -> OnlineDataHandler{
         return instance
     }
    
    func requestMoviesOnline(action : @escaping () -> Void) {
        
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let urlRequest = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        session.dataTask(with: urlRequest) { (data, response, error) in
            do{
                var json = try JSONSerialization.jsonObject(with: data!, options: []) as! Array<Dictionary<String,Any>>

                for index in 0...json.count-1{
                    let dictionary = json[index]
                    var genere=""
                    let genereArray = dictionary["genre"] as! NSArray
                    for genereIndex in 0...genereArray.count-1{
                        genere.append(genereArray[genereIndex] as! String)
                        genere.append(" , ")
                    }
                    
                    self.moviesArray.append(Movie(mTitle: dictionary["title"] as! String, mImage: dictionary["image"] as! String, mrating: (dictionary["rating"] as? NSNumber)?.floatValue ?? 0  , mReleaseYear: dictionary["releaseYear"] as! Int, mGenre: genere))
                    
                }
                
                if self.moviesArray.count > 0{
                    self.coreDataHandler?.insertInWebserviceMovies(arrayOfMovies: self.moviesArray)
                }
                
                print("real finish")
                action()
                
            }catch{
                print("error happened")
            }
            }.resume()
        
        
    }
    
    
}
