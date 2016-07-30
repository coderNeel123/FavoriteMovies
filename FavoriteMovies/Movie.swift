//
//  Movie.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding {
    
    private var _imagePath: String!
    var imagePath: String {
        get {
            return _imagePath
        }
    }
    
    private var _movieName: String!
    var movieName: String {
        get {
            return _movieName
        }
    }
    
    private var _movieDescription: String!
    var movieDescription: String {
        get {
            return _movieDescription
        }
    }
    
    private var _movieUrl: String!
    var movieUrl: String {
        get {
            return _movieUrl
        }
    }
    
    private var _moviePlot: String!
    var moviePlot: String {
        get {
            return _moviePlot
        }
    }
    
    init(imagePath: String, movieName: String, movieDescription:String, movieUrl: String, moviePlot: String) {
        self._imagePath = imagePath
        self._movieName = movieName
        self._movieDescription = movieDescription
        self._movieUrl = movieUrl
        self._moviePlot = moviePlot

    }
    
    override init () {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        self.init()
        
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        
        self._movieName = aDecoder.decodeObjectForKey("movieName") as? String
        
        self._movieDescription = aDecoder.decodeObjectForKey("movieDescription") as? String
        
        self._movieUrl = aDecoder.decodeObjectForKey("movieUrl") as? String
        
        self._moviePlot = aDecoder.decodeObjectForKey("movieplot") as? String

        
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self._imagePath, forKey: "imagePath") 
        
        aCoder.encodeObject(self._movieName, forKey: "movieName")
        
        aCoder.encodeObject(self._movieDescription, forKey: "movieDescription")
        
        aCoder.encodeObject(self._movieUrl, forKey: "movieUrl")
        
        aCoder.encodeObject(self._moviePlot, forKey:"movieplot")
    }


}
