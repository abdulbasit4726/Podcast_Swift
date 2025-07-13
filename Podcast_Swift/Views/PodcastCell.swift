//
//  PodcastCell.swift
//  Podcast_Swift
//
//  Created by Abdul Basit on 12/07/2025.
//
import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblEpisodeCount: UILabel!
    
    var podcast: Podcast! {
        didSet {
            lblTrackName.text = podcast.trackName
            lblArtistName.text = podcast.artistName
            lblEpisodeCount.text = "\(podcast.trackCount ?? 0) Episodes"
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else { return }
            podcastImageView.sd_setImage(with: url)
        }
    }
}
