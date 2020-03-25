//
//  Movie.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation
class Movie {
    var title : String
    var image : String
    var rating : Float
    var releaseYear : Int
    var genre : String
    
    init(mTitle:String , mImage:String , mrating:Float , mReleaseYear:Int , mGenre:String){
        title = mTitle
        image = mImage
        rating = mrating
        releaseYear = mReleaseYear
        genre = mGenre
    }
}
