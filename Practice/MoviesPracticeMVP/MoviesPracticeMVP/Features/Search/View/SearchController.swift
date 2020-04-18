//
//  SearchController.swift
//  MoviesPracticeMVP
//
//  Created by Esraa Hassan on 4/12/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit
import Kingfisher

class SearchController: UITableViewController {

    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    var queryValue:String?
    var moviesArray = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeActivityIndicator()
        
        let closure = { (moviesArrayNew:[Movie]) -> Void in
            DispatchQueue.main.async {
                self.moviesArray = moviesArrayNew
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.tableView.isUserInteractionEnabled = true
            }
        }
        
        queryValue = queryValue?.replacingOccurrences(of: " ", with: "%20")
        OnlineSearchHandler().getMoviesData(closure: closure, query:queryValue ?? "")
    }
    
    private func initializeActivityIndicator(){
        
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.hidesWhenStopped = true
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 8, y: 8)
        activityIndicator.transform = transform
        
        activityIndicator.startAnimating()
        tableView.isUserInteractionEnabled = false
        self.view.addSubview(activityIndicator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! MovieCustomCell

        cell.titleLabel.text = moviesArray[indexPath.row].title
        cell.releaseYearLabel.text = String(moviesArray[indexPath.row].releaseYear)
        cell.ratingLabel.text = String(moviesArray[indexPath.row].rating)
        
        var imageURL = Constants.imageBaseURL
        imageURL.append(moviesArray[indexPath.row].image)
        
        cell.movieImageView.kf.setImage(with: URL(string: imageURL), placeholder: UIImage(named: "noImage.png"), options: [], progressBlock: nil, completionHandler: nil)
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: NSNotification.Name.searchMovieData, object: nil, userInfo: ["movie":moviesArray[indexPath.row]])
        
        self.navigationController?.popViewController(animated: true)
    }

}



