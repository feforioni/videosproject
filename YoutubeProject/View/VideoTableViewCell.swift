//
//  VideoTableViewCell.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 14/06/23.
//

import Kingfisher
import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var channelLogoImageView: UIImageView!
    @IBOutlet weak var channelAndViewLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var tittleVideoLabel: UILabel!
    
    // Constants
    private let channelImageViewHeight: CGFloat = 50
    
    func configure(with videoAtual: Video) {
        tittleVideoLabel.text = videoAtual.title
        let thumbImageURL = URL(string: videoAtual.thumbUrlString)
        thumbnailImageView.kf.setImage(with: thumbImageURL)
        channelLogoImageView.layer.cornerRadius = channelImageViewHeight / 2
        channelAndViewLabel.text = "\(videoAtual.channelName) • \(videoAtual.views)K"
    }
}
