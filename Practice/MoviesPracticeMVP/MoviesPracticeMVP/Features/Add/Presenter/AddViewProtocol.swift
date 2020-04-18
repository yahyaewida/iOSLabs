//
//  AddViewProtocol.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/8/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation

protocol AddViewProtocol {
     func insertNewMovie(title: String, image: String, rating: Float , releaseYear: Int, genre: String) 
}
