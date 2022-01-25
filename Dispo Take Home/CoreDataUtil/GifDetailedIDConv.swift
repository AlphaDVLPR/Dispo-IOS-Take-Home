//
//  GifDetailedIDConv.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/25/22.
//

import Foundation
import CoreData

extension GifDetailedID {
    
    convenience init(gifID: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.gifID = gifID
    }
}
