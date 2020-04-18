//
//  MainScreenPresenter.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/6/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation
import CoreData
class MainScreenPresenter : MainScreenProtocol{       
    
    //Variables
    var coreDataHandler:CoreDataProtocol?
    var networkConnectionHandler:NetworkConnectionProtocol?
    var onlineDataHandler:OnlineDataHandler?
   
    init() {
        coreDataHandler = CoreDataHandler.getCoreHandlerInstance()
        networkConnectionHandler =  NetworkConnectionHandler.getInstance()
        onlineDataHandler = OnlineDataHandler.getInstance()
       
    }

    func requestRemoteMovies(closure : @escaping () -> Void) {
        if isNetworkConnected(){
            onlineDataHandler?.requestMoviesOnline(action : closure)
        }
    }
    
    func isNetworkConnected() -> Bool {
        return (networkConnectionHandler?.isConnected()) ?? false
    }
    
    func getLocalMovies() -> Array<NSManagedObject> {
        return (coreDataHandler?.getLocalMovies()) ?? Array<NSManagedObject>()
    }
    
    func getWebserviceMovies() -> Array<NSManagedObject> {
        return (coreDataHandler?.getWebserviceMovies()) ?? Array<NSManagedObject>()
    }
    
    internal func insertInWebserviceMovies(arrayOfMovies:[Movie]) {        
         coreDataHandler?.insertInWebserviceMovies(arrayOfMovies: arrayOfMovies)
    }
    
    func deleteMovieFromEntity(entityName: String, managedObject: NSManagedObject){
        coreDataHandler?.deleteFromEntity(entityName: entityName, object: managedObject)
    }
    
    
    
    
}
