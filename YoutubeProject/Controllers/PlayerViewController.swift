//
//  ViewController.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 26/05/23.
//

import UIKit
import YoutubePlayer_in_WKWebView

class PlayerViewController: UIViewController, WKYTPlayerViewDelegate {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var loadingActIndicator: UIActivityIndicatorView!
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var thumbsUpButton: UIButton!
    @IBOutlet weak var thumbsDownButton: UIButton!
    var viewCount = 0
    var isPaused = true
    var isLiked = false
    var isDisliked = false
    var isSubscribed = false
    var id: String
    var videoTittle: String
    
    init(videoId: String, title: String) {
        self.id = videoId
        self.videoTittle = title
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTitleLabel.text = videoTittle
        playerView.delegate = self
        playerView.load(withVideoId: id)
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
    
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
    
    func styleLikeButtons() {
        if isLiked, !isDisliked {
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

