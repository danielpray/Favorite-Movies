//
//  DisplayVC.swift
//  Favorite-Movies
//
//  Created by Daniel Ray on 5/13/16.
//  Copyright © 2016 Daniel Ray. All rights reserved.
//

import UIKit
import CoreData

class DisplayVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieURL: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    
    var movies = [Movie]()
    var indexOfMovie: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        fetchAndSetResults()
        
        print(indexOfMovie)
        
      
        
        
        movieImage.image = movies[indexOfMovie].getMovieImage()
        movieDescription.text = movies[indexOfMovie].movieDesc
        movieName.text = movies[indexOfMovie].name
        movieURL.text = movies[indexOfMovie].imdbLink
        moviePlot.text = movies[indexOfMovie].imdbPlot
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



}
