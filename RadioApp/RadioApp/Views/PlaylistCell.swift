//  PlaylistCell.swift

import UIKit

class PlaylistCell: UITableViewCell {
    
    // Links properties of cell
    @IBOutlet var titleLabel: UILabel! // DJ Playlist's title
    @IBOutlet var playlistImage: UIImageView! // DJ Playlist's image
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // styling of UIImageView
        playlistImage.layer.borderWidth=1.0
        playlistImage.layer.masksToBounds = false
        playlistImage.layer.borderColor = UIColor.white.cgColor
        playlistImage.layer.cornerRadius = 30
        playlistImage.clipsToBounds = true
        
        titleLabel.adjustsFontForContentSizeCategory = true
        playlistImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
}

