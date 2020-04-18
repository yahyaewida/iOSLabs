//
//  TableViewExtension.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/8/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MainViewController{
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            switch indexPath.section{
            case 0:
                
                mainScreenPresenter.deleteMovieFromEntity(entityName: "LocalMovies", managedObject: movies[indexPath.row])
                movies.remove(at: indexPath.row)
            case 1:
                
                mainScreenPresenter.deleteMovieFromEntity(entityName: "RemoteMovies", managedObject: remoteMoviesFromCache[indexPath.row])
                
                remoteMoviesFromCache.remove(at: indexPath.row)
            default:
                break
            }
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
            tableView.reloadData()
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = movies[indexPath.row].value(forKey: "title") as? String
            cell.releaseYearLabel.text = String(movies[indexPath.row].value(forKey: "releaseYear") as! Int)
            
            var imageURL = Constants.imageBaseURL
            imageURL.append((movies[indexPath.row].value(forKey: "imagePath") as? String)!)
            
            cell.movieImageView?.kf.setImage(with: URL(string: imageURL), placeholder: UIImage(named: "noImage.png"), options: [], progressBlock: nil, completionHandler: nil)
            
        case 1:
            
            cell.titleLabel.text = (remoteMoviesFromCache[indexPath.row].value(forKey: "title") as? String) ?? "loading"
            cell.releaseYearLabel.text = String((remoteMoviesFromCache[indexPath.row].value(forKey: "releaseYear") as? Int) ?? 0)
            
            cell.movieImageView.kf.setImage(with: URL(string: ((remoteMoviesFromCache[indexPath.row].value(forKey: "imagePath") as? String)) ?? "" ))
                
        default:
            break
        }
        
        return cell;
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "local"
        case 1: return "Remote"
        default:
            return "local"
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return movies.count
        case 1:
            return remoteMoviesFromCache.count
            
        default:
            break
        }
        return moviesArray.count;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "detailsScreen") as! DetailsViewController
        
        var movieObject :NSManagedObject?
        switch indexPath.section {
        case 0:
            movieObject = movies[indexPath.row]
            
        case 1:
            movieObject = remoteMoviesFromCache[indexPath.row]
        default:
            break
        }
        detailsView.movie = Movie(mTitle: movieObject?.value(forKey: "title") as! String, mImage: movieObject?.value(forKey: "imagePath") as! String, mrating: movieObject?.value(forKey: "rating") as! Float, mReleaseYear: movieObject?.value(forKey: "releaseYear") as! Int, mGenre: movieObject?.value(forKey: "genre") as! String)
        
        self.navigationController?.pushViewController(detailsView, animated: true)
        
    }
    
}
