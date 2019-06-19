//
//  PlaylistController.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    //SINGLETON
    static let sharedInstance = PlaylistController()
    
    //SOURCE OF TRUTH
    var playlists: [Playlist] = []
    
    //CRUD FUNCTIONS
    func createPlaylistWith(name: String) {
        Playlist(name: name)
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlistToDelete: Playlist) {
        if let moc = playlistToDelete.managedObjectContext {
            moc.delete(playlistToDelete)
            saveToPersistentStore()
        }
    }
    
    //SAVE
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving to moc: \(error.localizedDescription)")
        }
    }
}
