//
//  SongListTableViewController.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    //LANDING PAD FOR DATA
    var playlistLandingPad: Playlist?
    
    //OUTLETS
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    //VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlistLandingPad?.name
    }

    //ACTIONS
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let title = songNameTextField.text, title != "",
        let artist = artistNameTextField.text, artist != ""
            else { return }
        
        guard let playlist = playlistLandingPad else { return }
        SongController.sharedInstance.createNewSongWith(title: title, artist: artist, playlist: playlist)
        
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    //TABLE VIEW DATA
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistLandingPad?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let song = playlistLandingPad?.songs?[indexPath.row] as? Song
            else { return UITableViewCell() }
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist

        return cell
    }

    //DELETE CELL
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let song = playlistLandingPad?.songs?[indexPath.row] as? Song
                else { return }
            SongController.sharedInstance.deleteSong(songToDelete: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
