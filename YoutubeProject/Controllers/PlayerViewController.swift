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
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var thumbsUpButton: UIButton!
    @IBOutlet weak var thumbsDownButton: UIButton!
    var viewCount = 0
    var isPaused = true
    var isLiked = false
    var isDisliked = false
    var isSubscribed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingActIndicator.isHidden = true
        loadingActIndicator.isUserInteractionEnabled = false
        subscribeButton.layer.cornerRadius = 15
    }
    
    
    // Like
    // condicao: isLiked == true e isDisliked == false
    // thumbsUp: blue  thumbsDown: label
    //
    // Dislike
    // condicao: isLiked = False  isDisliked = True
    // thumbsUp: .label  thumbsDown: .blue
    //
    // Nem nem
    // condicao: isLiked = false  isDisliked = false
    // thumbsUp: .label  thumbsDown: .label
    
    @IBAction func onThumbsUpButtonTapped(_ sender: Any) {
        isLiked = !isLiked
        isDisliked = false
        styleLikeButtons()
    }
    
    @IBAction func onThumbsDownButtonTapped(_ sender: Any) {
        isDisliked = !isDisliked
        isLiked = false
        styleLikeButtons()
    }
    
    func styleLikeButtons() {
        if isLiked == true && isDisliked == false {
            thumbsDownButton.tintColor = .label
            thumbsUpButton.tintColor = .blue
        } else if isLiked == false && isDisliked == true {
            thumbsDownButton.tintColor = .blue
            thumbsUpButton.tintColor = .label
        } else if isLiked == false && isDisliked == false {
            thumbsDownButton.tintColor = .label
            thumbsUpButton.tintColor = .label
        }
    }
    
    @IBAction func onSubscribeButtonTapped(_ sender: Any) {
        isSubscribed = !isSubscribed
        if isSubscribed {
            subscribeButton.backgroundColor = .lightGray
        } else {
            subscribeButton.backgroundColor = .red
        }
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

