//
//  DetailVC.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var movieNameDetail: UILabel!
    @IBOutlet weak var urlDetail: UILabel!
    @IBOutlet weak var plotDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        configureMovieDetail(DataService.instance.movieHolderData)

    }
 
    func configureMovieDetail (movie: Movie) {
        let convertedMovieImage = DataService.instance.convertPathToImage(movie.imagePath)
        imageDetail.image = convertedMovieImage
        movieNameDetail.text = movie.movieName
        urlDetail.text = "Url: \(movie.movieUrl)"
        plotDetail.text = "Plot: \(movie.moviePlot)"
        descriptionDetail.text = "Plot: \(movie.movieDescription)"
        
        DataService.instance.linkClicked = movie.movieUrl
    }
    
    
 

    
    @IBAction func goBackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func urlPressed(sender: AnyObject) {
        
    }
    
}


