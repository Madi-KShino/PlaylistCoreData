//
//  PlaylistListTableViewController.swift
//  Playlist With Core Data
//
//  Created by Madison Kaori Shino on 6/19/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class PlaylistListTableViewController: UITableViewController {

    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
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
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    //SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}


