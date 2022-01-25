//
//  IDControllerCoreData.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/25/22.
//

import Foundation
import CoreData

struct IDControllerCoreData {
    
    static let shared = IDControllerCoreData()
    
    var fetchedResultsController: NSFetchedResultsController<GifDetailedID>
    init() {
        let fetchRequest: NSFetchRequest<GifDetailedID> = GifDetailedID.fetchRequest()
        let isComplete = NSSortDescriptor(key: "gifID", ascending: false)
        
        fetchRequest.sortDescriptors = [isComplete]
        
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            print("error fetching entries: \(error.localizedDescription)")
            
        }
    }
    
    //MARK: - CRUD
    
    //Create
    func createGifID(GifID: String) {
        _ = GifDetailedID(gifID: GifID)
        saveToPersistentStores()
    }

    //Save
    func saveToPersistentStores() {
        do {
            if CoreDataStack.context.hasChanges {
                try CoreDataStack.context.save()
            }
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n~~~\n \(error)")
        }
    }
}

