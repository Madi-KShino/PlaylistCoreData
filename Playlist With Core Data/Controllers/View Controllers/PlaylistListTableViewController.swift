//
//  PlaylistListTableViewController.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class PlaylistListTableViewController: UITableViewController {

    //OUTLETS
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    //VIEW DID LOAD & WILL APPEAR
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //ACTIONS
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let name = playlistNameTextField.text, name != ""
            else { return }
        
        PlaylistController.sharedInstance.createPlaylistWith(name: name)
        
        playlistNameTextField.text = ""
        tableView.reloadData()
    }
    
    //TABLE VIEW DATA
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedInstance.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)

        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\((playlist.songs?.count) ?? 0) Songs"
        
        return cell
    }
    
    //DELETING CELLS
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playlistToDelete: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    //SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow,
        let destinationVC = segue.destination as? SongListTableViewController
            else { return }
        let playlistToSend = PlaylistController.sharedInstance.playlists[index.row]
        destinationVC.playlistLandingPad = playlistToSend
    }
}
