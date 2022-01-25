//
//  CoreDataStack.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/25/22.
//

import Foundation
import CoreData

//Creates your MOC

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GifDetailedID")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("Failed to Load Persistent Store \(error)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
