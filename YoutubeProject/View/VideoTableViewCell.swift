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
        var formattedViews: String = ""
        let views = Double(videoAtual.views)
        if views < 1000 {
            formattedViews = String(views)
        } else if views >= 1000 {
            if views < 1000000 {
                formattedViews = String(format: "%.1f", views / 1000) + "K"
            } else {
                formattedViews = String(format: "%.1f", views / 1000000) + "M"
            }
        }
        channelAndViewLabel.text = "\(videoAtual.channelName) • \(formattedViews)"
    }
}
