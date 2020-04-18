//
//  ViewController.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit
import Kingfisher
class DetailsViewController: UIViewController {
    

    @IBOutlet weak var detailsScrollView: UIScrollView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: Movie?
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = movie!.title
        detailsScrollView.contentSize = CGSize(width: 100   , height:   100)
        if movie!.image.contains("http"){
            movieImageView.kf.setImage(with:URL(string: movie!.image))
        }else{
            var imageURL = Constants.imageBaseURL
            imageURL.append(movie!.image)
            
            movieImageView.kf.setImage(with: URL(string: imageURL), placeholder: UIImage(named: "noImage.png"), options: [], progressBlock: nil, completionHandler: nil)
        }
        genreLabel.text = movie!.genre
        
        releaseYearLabel.text = String(movie!.releaseYear)
        ratingLabel.text = String(movie!.rating)
       
    }

  
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

