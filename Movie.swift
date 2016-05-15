//
//  Movie.swift
//  Favorite-Movies
//
//  Created by Daniel Ray on 5/11/16.
//  Copyright © 2016 Daniel Ray. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    
}
