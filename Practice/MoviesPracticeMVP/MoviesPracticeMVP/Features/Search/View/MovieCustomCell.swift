//
//  MovieCustomCell.swift
//  MoviesPracticeMVP
//
//  Created by Esraa Hassan on 4/12/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import UIKit

class MovieCustomCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var movieImageView: UIImageView!    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    //Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
