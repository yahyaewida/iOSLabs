//
//  MainScreenPrtocol.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/6/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation
import CoreData

protocol MainScreenProtocol{
       
    //Operations
    func isNetworkConnected() -> Bool
    func requestRemoteMovies(closure : @escaping () -> Void)
    func getLocalMovies() -> Array<NSManagedObject>
    func deleteMovieFromEntity(entityName: String, managedObject: NSManagedObject)
}
