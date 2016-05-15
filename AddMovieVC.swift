//
//  AddMovieVC.swift
//  Favorite-Movies
//
//  Created by Daniel Ray on 5/11/16.
//  Copyright © 2016 Daniel Ray. All rights reserved.
//

import UIKit
import CoreData



class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieDescription: UITextField!
    @IBOutlet weak var movieURL: UITextField!
    @IBOutlet weak var moviePlot:UITextField!
    
    var imgPicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        movieImage.layer.cornerRadius = 4.0
        movieImage.clipsToBounds = true


        
    }
    
    @IBAction func saveMovie(sender: UIButton!) {
        
        if let name = movieName.text where name != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie =  Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.setMovieImage(movieImage.image!)
            movie.name = movieName.text
            movie.movieDesc = movieDescription.text
            movie.imdbLink = movieURL.text
            movie.imdbPlot = moviePlot.text
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch  {
                
                print("Could not save Movie")
            
            }
            
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func cancel(sender:UIButton!) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func addMoviePic(sender:UIButton!) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
        
        
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
        
    }

    
}
