//
//  NewMovieVC.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import UIKit

class NewMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieUrl: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var movieDescription: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieTitle.delegate = self
        self.movieUrl.delegate = self
        self.moviePlot.delegate = self
        self.movieDescription.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

    }

    @IBAction func addImageButtonPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMovieButtonPressed(sender: AnyObject) {
        if let movieTitle = movieTitle.text, let movieImage = movieImage.image, movieUrl = movieUrl.text, moviePlot = moviePlot.text, movieDescription = movieDescription.text {
            
            let imagePath = DataService.instance.convertImageToPath(movieImage)
            let movie = Movie(imagePath: imagePath, movieName: movieTitle, movieDescription: movieDescription, movieUrl: movieUrl, moviePlot: moviePlot)
            DataService.instance.addMovie(movie)
            dismissViewControllerAnimated(true, completion: nil)

            
        }
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        movieImage.image = image
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
