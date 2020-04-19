// DJPlaylistViewController.Swift

import UIKit

class DJPlaylistViewController: UITableViewController {

    
    // Playlist database object to be manipulated
    let playlistDB = DJPlaylistDatabase.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // reloads the data of the view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if showPlaylist identifiers is the one seguing
        switch segue.identifier {
        case "showPlaylist"?:
            break
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
        
        // show's the playlist on spotify
        if segue.identifier == "showPlaylist" {
            
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the playlist associated with this row and pass it along
                let playlist = playlistDB.playlists[row]
                let browserViewController = segue.destination as! BrowserViewController
                browserViewController.playlist = playlist
            }
        }
    }
    
    // returns the number of rows based on playlist in database
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistDB.playlistCount()
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! PlaylistCell
        
        // finds the playlist for that specific row
        let playlist = playlistDB.playlists[indexPath.row]
        
        // sets the cell's label to the playlist's title
        cell.titleLabel.text = playlist.title
        
        // sets the cell's image to the associated playlist image
        let image : UIImage = UIImage(named: playlist.imageName)!
        cell.playlistImage.image = image
        
        return cell
    }
}

