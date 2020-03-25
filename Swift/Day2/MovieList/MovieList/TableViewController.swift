//
//  TableViewController.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
     var moviesArray :[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMovies()
        
    }
    func initializeMovies() {
        
        moviesArray.append(Movie(mTitle: "fast & furious 9", mImage: "ff9.jpg", mrating: 9.2, mReleaseYear: 2020, mGenre: "Action"))
        
        moviesArray.append(Movie(mTitle: "1917", mImage: "1917.jpg", mrating: 8.7, mReleaseYear: 2019, mGenre: "war / drama"))
        
        moviesArray.append(Movie(mTitle: "ford v ferrari", mImage: "fordvferrari.png", mrating: 9.3, mReleaseYear: 2019, mGenre: "sport / drama"))
        
        moviesArray.append(Movie(mTitle: "Inception", mImage: "inception.png", mrating: 8.8, mReleaseYear: 2010, mGenre: "Thriller / Sci-fic"))
        
        moviesArray.append(Movie(mTitle: "Avengers end-game", mImage: "avengers.jpg", mrating: 8.8, mReleaseYear: 2019, mGenre: "Action / Sci-fic"))
    }
   
  
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = moviesArray[indexPath.row].title
        
        cell.imageView?.image = UIImage.init(named: moviesArray[indexPath.row].image)
        
        return cell;
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "detailsScreen") as! DetailsViewController
        
        detailsView.movie = moviesArray[indexPath.row]
        
        
        self.navigationController?.pushViewController(detailsView, animated: true)
        
        
        
        
    }
    
    
}
