//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by Neel Khattri on 7/28/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: "postsLoaded", object: nil)
        DataService.instance.loadMovies()

        
    }

    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("hi")
        
        let movieHolder = DataService.instance.loadedMovies[indexPath.row]
        print(movieHolder.movieDescription)
        
        DataService.instance.movieHolderData = movieHolder
        
        print(DataService.instance.movieHolderData.movieDescription)
        
        
        
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = DataService.instance.loadedMovies[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? PostingTheMovie {
            cell.configureMovieCell(movie)
            return cell
        }
        else {
            let cell = PostingTheMovie()
            cell.configureMovieCell(movie)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    
    func onPostsLoaded (notif: AnyObject) {
        
        tableView.reloadData()
    }
    
}


