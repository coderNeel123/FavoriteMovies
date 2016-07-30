//
//  PostingTheMovie.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import Foundation
import UIKit

class PostingTheMovie: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    func configureMovieCell (movie: Movie) {
        let convertedMovieImage = DataService.instance.convertPathToImage(movie.imagePath)
        movieImage.image = convertedMovieImage
        movieName.text = movie.movieName
    }
}