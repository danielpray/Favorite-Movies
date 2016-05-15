//
//  MovieCell.swift
//  Favorite-Movies
//
//  Created by Daniel Ray on 5/11/16.
//  Copyright © 2016 Daniel Ray. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieURL: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImage.layer.cornerRadius = 4
        movieImage.clipsToBounds = true
    
    }
    
    func configureMovieCell(movie: Movie) {
        movieName.text = movie.name
        movieDescription.text = movie.movieDesc
        movieURL.text = movie.imdbLink
        movieImage.image = movie.getMovieImage()
        
        
    }

    
  
}
