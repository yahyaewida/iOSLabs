//
//  Constants.swift
//  MoviesPracticeMVP
//
//  Created by Esraa Hassan on 4/12/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation

struct Constants {
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
}


extension NSNotification.Name{
    public static let searchMovieData: NSNotification.Name = NSNotification.Name.init("searchMovie")
    public static let addedMovieData: NSNotification.Name = NSNotification.Name.init("addedMovie")
}


