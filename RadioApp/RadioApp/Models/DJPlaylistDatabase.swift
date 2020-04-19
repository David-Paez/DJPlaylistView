//  DJPlaylistDatabase.swift

import Foundation

final class DJPlaylistDatabase // can not be inherited
{
    
    static let sharedInstance = DJPlaylistDatabase () // create only one instance
    var playlists: [Playlist] = [] // list of playlist objects
    
    // class to create playlist objects
    class Playlist: NSObject {
        var title: String = ""
        var url: String = ""
        var imageName: String = ""
        
        // initialize object with name
        init (newTitle: String, newURL:String, newImage: String) {
            title = newTitle
            url = newURL
            imageName = newImage
        }
    }
    
    // initialize the database with the DJ Playlists
    private init() {
        addPlaylist(title: "HURRICANE DORIAN", url: "https://open.spotify.com/playlist/7hiHp9tYthjNNEHOKkaNKc", image: "hurricaneDorian")
        addPlaylist(title: "Back to School", url: "https://open.spotify.com/playlist/7AdkHrTh2i2aWyAuYlRD5g", image: "backToSchool")
        addPlaylist(title: "OSHEAGA 2019", url: "https://open.spotify.com/playlist/09TkpW1efthVHEnI9cKlqQ", image: "OSHEAGA")
        addPlaylist(title: "What We're Listening To", url: "https://open.spotify.com/playlist/3CLzrOQhQNFrpEqryZSnux", image: "listeningTo")
    }
    
    // add playlist to list of playlists
    func addPlaylist(title:String, url:String, image:String) -> Void
    {
        // creates new Playlist and adds it
        playlists.append(Playlist(newTitle: title, newURL:url, newImage:image))
    }
   
    // returns the amount of playlists
    func playlistCount() -> Int
    {
        return playlists.count
    }
    
}

