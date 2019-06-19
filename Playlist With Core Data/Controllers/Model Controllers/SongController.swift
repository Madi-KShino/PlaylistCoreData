//
//  SongController.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    //SINGLETON
    static let sharedInstance = SongController()
    
    //SOURCE OF TRUTH
    //not needed - all songs will exist on the Playlist
    
    //CRUD FUNCTIONS
    func createNewSongWith(title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    func deleteSong(songToDelete: Song) {
        if let moc = songToDelete.managedObjectContext {
            moc.delete(songToDelete)
            PlaylistController.sharedInstance.saveToPersistentStore()
        }
    }
}
