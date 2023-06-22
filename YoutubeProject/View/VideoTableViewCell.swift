//
//  VideoTableViewCell.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 14/06/23.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var channelLogoImageView: UIImageView!
    @IBOutlet weak var channelAndViewLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var tittleVideoLabel: UILabel!
    
    func configure(with videoAtual: Video) {
        tittleVideoLabel.text = videoAtual.title
        thumbnailImageView.image = UIImage(named: videoAtual.thumbName)
        channelLogoImageView.layer.cornerRadius = 25
        channelAndViewLabel.text = "\(videoAtual.channelName) • \(videoAtual.views)K"
    }
    
    
}
