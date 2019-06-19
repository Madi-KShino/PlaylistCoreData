//
//  Playlist+Convenience.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    //playlist attributes have already been declared, but still need to be initialized
    convenience init(name: String,
                     context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        //convenience initilizers must also have a self.init called
        self.init(context: context)
        self.name = name
    }
}
