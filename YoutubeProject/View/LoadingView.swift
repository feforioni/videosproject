//
//  self.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 03/07/23.
//

import UIKit

class LoadingView: UIView {
    override func didMoveToSuperview() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else { return }
        
        self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        self.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100).isActive = true
        
        loadingIndicator.startAnimating()
    }
}
