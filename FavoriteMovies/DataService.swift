//
//  DataService.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    var movieHolderData: Movie!
    
    var linkClicked: String = "https://www.google.com/"
    
    let movieKey = "movieKey"
    
    
    private var _loadedMovies = [Movie]()
    var loadedMovies: [Movie] {
        get {
            return _loadedMovies
        }
    }
    
    func saveMovies () {
        let encryptedMovieData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMovies)
        NSUserDefaults.standardUserDefaults().setObject(encryptedMovieData, forKey: movieKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadMovies() {
        if let movieData = NSUserDefaults.standardUserDefaults().objectForKey(movieKey) as? NSData {
            if let unencryptedMovieData = NSKeyedUnarchiver.unarchiveObjectWithData(movieData) {
            _loadedMovies = unencryptedMovieData as! [Movie]
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
    }
    
    func convertImageToPath (image:UIImage) -> String{
        let imageData = UIImagePNGRepresentation(image)
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imagePath)
        imageData?.writeToFile(fullPath, atomically: true)
        return imagePath
    }
    
    func convertPathToImage (path:String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addMovie (movie: Movie) {
        _loadedMovies.append(movie)
        saveMovies()
        loadMovies()
    }
    
    
    func documentsPathForFileName (name: String) -> String  {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
}
