//
//  ViewController.swift
//  Favorite-Movies
//
//  Created by Daniel Ray on 5/11/16.
//  Copyright © 2016 Daniel Ray. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchAndSetResults()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = app?.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let results = try context?.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            
            
            let movie = movies[indexPath.row]
            cell.configureMovieCell(movie)
            
            return cell
            
        } else {
            
            return MovieCell()
        }
        
        
      
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let index = indexPath.row
        
        
        performSegueWithIdentifier("goToDisplay", sender: index)
        
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
                
        if segue.identifier == "goToDisplay" {
            if let displayVC = segue.destinationViewController as? DisplayVC {
                if let i = sender as? Int {
                    
                    displayVC.indexOfMovie = i
                
                }
        
            }
            
            
        }
            

    
    
    }


}

