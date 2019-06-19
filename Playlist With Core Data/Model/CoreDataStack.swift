//
//  CoreDataStack.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: "Playlist_With_Core_Data")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var managedObjectContext: NSManagedObjectContext { return container.viewContext }
}
