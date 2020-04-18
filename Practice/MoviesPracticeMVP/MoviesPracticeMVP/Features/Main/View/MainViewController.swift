//
//  TableViewController.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData
class MainViewController: UITableViewController  {

    
    //Variables
    var mainScreenPresenter = MainScreenPresenter()
    var movies: [NSManagedObject] = []
    var remoteMoviesFromCache: [NSManagedObject] = []
    var moviesArray :[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NotificationCenter.default.addObserver(self, selector: #selector(addMovie(notification:)), name: NSNotification.Name.addedMovieData , object: nil)
        
        let closure = {
            self.remoteMoviesFromCache = self.mainScreenPresenter.getWebserviceMovies()
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("finished closure")
            }
        }
        mainScreenPresenter.requestRemoteMovies(closure:closure)
        
        
        movies = mainScreenPresenter.getLocalMovies()
        
        let insertButton = UIBarButtonItem.init(title: "Add", style: UIBarButtonItemStyle.plain, target: self, action: Selector("addButtonAction"))
        self.navigationItem.setRightBarButton(insertButton, animated: true)
    }
   
    @objc  func addButtonAction(){
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "addScreen") as! AddViewController
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    @objc func addMovie(notification :NSNotification){
        
         let managedObjectValue =  notification.userInfo?["addedMovie"] as! NSManagedObject
        movies.append(managedObjectValue)
        self.tableView.reloadData()
    }
    
}

