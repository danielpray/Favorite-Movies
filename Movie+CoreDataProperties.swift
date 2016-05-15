//
//  Movie+CoreDataProperties.swift
//  Favorite-Movies
//
//  Created by Daniel Ray on 5/11/16.
//  Copyright © 2016 Daniel Ray. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var name: String?
    @NSManaged var movieDesc: String?
    @NSManaged var imdbLink: String?
    @NSManaged var imdbPlot: String?
    @NSManaged var image: NSData?

}
