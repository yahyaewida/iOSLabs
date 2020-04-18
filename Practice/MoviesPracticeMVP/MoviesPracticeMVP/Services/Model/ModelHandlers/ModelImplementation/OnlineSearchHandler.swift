//
//  OnlineDataHandler.swift
//  MoviesPracticeMVP
//
//  Created by Esraa Hassan on 4/12/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation
import Alamofire

class OnlineSearchHandler{
    func getMoviesData(closure: @escaping (_ moviesArrayNew :[Movie]) -> Void,query:String) {
        
        var moviesArray = [Movie]()
        
        Alamofire.request("https://api.themoviedb.org/3/search/movie?api_key=9ba2a10e20c15ef6fb276c33692ba9e8&query=\(query)")
            .responseJSON{(response) -> Void in
                if let json = response.result.value as![String:Any]?{
                    var results = json["results"]! as! Array<Dictionary<String,Any>>
                    if results.count > 0{
                        for index in 0...results.count-1{
                            let dictionary = results[index]
                            var genere=""
                            let genereArray = dictionary["genre_ids"] as! NSArray
                            if genereArray.count > 0 {
                                for genereIndex in 0...genereArray.count-1{
                                    genere.append(String(genereArray[genereIndex] as! Int))
                                    genere.append(" , ")
                                }
                            }
                            
                            var releaseYear = 0
                            
                            let releaseDateArray = (dictionary["release_date"] as? String)?.split(separator: "-")
                            if releaseDateArray != nil && (releaseDateArray?.count)! > 0{
                                releaseYear = Int(releaseDateArray![0])!
                            }
                            
                            
                            moviesArray.append(Movie(mTitle: dictionary["title"] as! String, mImage: dictionary["poster_path"] as? String ?? "", mrating: (dictionary["vote_average"] as? NSNumber)?.floatValue ?? 0.0  , mReleaseYear: releaseYear , mGenre: genere))
                        }
                    }
                    closure(moviesArray)
                }
        }
        
        
        
    }
}
