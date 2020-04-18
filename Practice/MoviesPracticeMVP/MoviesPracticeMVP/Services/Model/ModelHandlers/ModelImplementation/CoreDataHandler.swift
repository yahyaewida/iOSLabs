//
//  CoreDataHandler.swift
//  MovieListNetwork
//
//  Created by Esraa Hassan on 4/1/20.
//  Copyright © 2020 Yahya. All rights reserved.
//
import UIKit
import Foundation
import CoreData
class CoreDataHandler : CoreDataProtocol{
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private  var managedContext:NSManagedObjectContext?
    private static var instance = CoreDataHandler()
    
    private init () {
         managedContext = appDelegate.persistentContainer.viewContext
    }
    
    static func getCoreHandlerInstance() -> CoreDataHandler {
        return instance
    }
    
   
    
    func insertInLocalMovies(movie movieValue:Movie)  -> NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: "LocalMovies", in: managedContext!)
        
        let movie = prepareNSManagedObject(movieValue: movieValue, entity: entity!)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in insertInLocalMovies")
        }
        return movie
    }
    
     func getLocalMovies() -> Array<NSManagedObject> {
       return fetchData(entityName: "LocalMovies")
    }
    
    func getWebserviceMovies() -> Array<NSManagedObject> {
        return fetchData(entityName: "RemoteMovies")
    }
    
    private func fetchData(entityName:String) -> Array<NSManagedObject>{
        
        var movies = Array<NSManagedObject>()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        do{
            movies = try managedContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetchData")
        }
        return movies
    }
    
    private func prepareNSManagedObject(movieValue:Movie,entity :NSEntityDescription) -> NSManagedObject{
        
        let movie = NSManagedObject(entity: entity, insertInto: managedContext!)
        movie.setValue(movieValue.title, forKey: "title")
        movie.setValue(movieValue.image, forKey: "imagePath")
        movie.setValue(movieValue.genre, forKey: "genre")
        movie.setValue(movieValue.rating, forKey: "rating")
        movie.setValue(movieValue.releaseYear, forKey: "releaseYear")
        
        return movie
    }
    
    func insertInWebserviceMovies(arrayOfMovies:[Movie]) {
        let entity = NSEntityDescription.entity(forEntityName: "RemoteMovies", in: managedContext!)
        clearWebserviceMovies()
        for index in 0...arrayOfMovies.count-1 {
            
            let movieValue = arrayOfMovies[index]
            prepareNSManagedObject(movieValue: movieValue, entity: entity!)
            
            do{
                try managedContext!.save()
            }
            catch{
                print("error in insertInWebserviceMovies")
            }
        }
    }
    
    func deleteFromEntity(entityName name:String , object value:NSManagedObject){
        managedContext?.delete(value)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in deleteFromEntity")
        }
    }	
    
    func clearWebserviceMovies(){
        do{
            var remoteMovies = getWebserviceMovies()
            if remoteMovies.count>0{
                for index in 0...remoteMovies.count-1 {
                    managedContext?.delete(remoteMovies[index])
                }
                
                try managedContext?.save()
            }
        }
        catch{
            print("error in clearWebserviceMovies")
        }
    
    }
    
    func clearLocalMovies(){
        do{
            let localMovies = getLocalMovies()
            if localMovies.count>0{
                for index in 0...localMovies.count-1 {
                    managedContext?.delete(localMovies[index])
                }
                try managedContext?.save()
            }
        }
        catch{
            print("error in clearWebserviceMovies")
        }
        
    }
    
    
 
    
    
    
}
