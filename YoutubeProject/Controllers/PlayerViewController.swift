//
//  ViewController.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 26/05/23.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var loadingActIndicator: UIActivityIndicatorView!
    var viewCount = 0
    var isPaused = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingActIndicator.isHidden = true
        loadingActIndicator.isUserInteractionEnabled = false
    }

    @IBAction func onPlayButtonTapped(_ sender: Any) {
        if isPaused {
            isPaused = false
            thumbImageView.isHidden = true
            loadingActIndicator.isHidden = false
            playButton.setImage(nil, for: .normal)
            viewCount = viewCount + 1
        } else {
            isPaused = true
            thumbImageView.isHidden = false
            loadingActIndicator.isHidden = true
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
    }
    
}

