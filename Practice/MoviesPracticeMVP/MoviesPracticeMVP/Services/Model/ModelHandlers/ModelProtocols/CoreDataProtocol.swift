//
//  CoreDataProtocol.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/8/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation
import CoreData
protocol CoreDataProtocol {
    //initialization
    static func getCoreHandlerInstance() -> CoreDataHandler
    
    //Operations
    func insertInLocalMovies(movie movieValue:Movie) -> NSManagedObject
    func getLocalMovies() -> Array<NSManagedObject>
    func getWebserviceMovies() -> Array<NSManagedObject>
    func insertInWebserviceMovies(arrayOfMovies:[Movie])
    func deleteFromEntity(entityName name:String , object value:NSManagedObject)
    func clearWebserviceMovies()
    func clearLocalMovies()
    
    
}
