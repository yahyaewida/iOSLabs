//
//  ViewController.swift
//  MovieList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: Movie?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = movie!.title
        
        movieImageView.image = UIImage.init(named: (movie?.image)!)
        
        
        genreLabel.text = movie!.genre
        
        releaseYearLabel.text = String(movie!.releaseYear)
        ratingLabel.text = String(movie!.rating)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

