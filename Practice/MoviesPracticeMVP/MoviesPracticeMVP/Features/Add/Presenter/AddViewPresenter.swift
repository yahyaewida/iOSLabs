//
//  AddViewPresenter.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/8/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation

class AddViewPresenter : AddViewProtocol{
    
    var mainScreenView : InsertMovieProtocol?
    var coreDataHandler:CoreDataProtocol?
    
    init(mainScreen : InsertMovieProtocol){
        mainScreenView = mainScreen
        coreDataHandler = CoreDataHandler.getCoreHandlerInstance()
    }
    
    func insertNewMovie(title: String, image: String, rating: Float , releaseYear: Int, genre: String) {
        
        let newMovie = Movie(mTitle: title, mImage: image, mrating: Float(rating) ?? 0.0 , mReleaseYear: Int(releaseYear) ?? 2020 , mGenre: genre)
        
        let managedObject = coreDataHandler?.insertInLocalMovies(movie: newMovie)
        mainScreenView?.insertMovie(newMovie: newMovie, managedObject: managedObject!)
        
    }
}
