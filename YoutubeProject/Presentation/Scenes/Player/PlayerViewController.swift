//
//  ViewController.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 26/05/23.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var viewCountLabel: UILabel!
    var viewCount = 0
    var isPaused = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPlayButtonTapped(_ sender: Any) {
        
        viewCountLabel.text = String(viewCount)
        if isPaused {
            isPaused = false
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            viewCount = viewCount + 1
            viewCountLabel.text = String(viewCount)
        } else {
            isPaused = true
            playButton.setImage(UIImage(systemName: "play.rectangle.fill"), for: .normal)
        }
    }
    
}

