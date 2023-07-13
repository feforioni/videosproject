//
//  VideosRepository.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 19/06/23.
//

import Foundation
struct VideosRepository {
    func getVideos() -> [Video] {
        return [
            Video(title: "Windows is A.I. Now", //
                  thumbUrlString: "ThumbNail",       //
                  channelName: "TechLinked",    //     0
                  views: 475,                   //
                  channelImageUrlString: "channelImageName"), //
            Video(title: "A Swing And A Miss",
                  thumbUrlString: "ASwingAndAMiss",
                  channelName: "TechLinked",
                  views: 300,
                  channelImageUrlString: "channelImageName"),
            Video(title: "Use Crypto, Get Tracked",
                  thumbUrlString: "UseCryptoGetTracked",
                  channelName: "TechLinked",
                  views: 325,
                  channelImageUrlString: "channelImageName"),
            Video(title: "Our Boss Fired Himself",
                  thumbUrlString: "OurBossFiredHimself",
                  channelName: "TechLinked",
                  views: 539,
                  channelImageUrlString: "channelImageName"),
            Video(title: "AI is Mainstream. What Do We Do?",
                  thumbUrlString: "AiIsaMainstream",
                  channelName: "TechLinked",
                  views: 539,
                  channelImageUrlString: "channelImageName"),
            Video(title: "It’s Worse Than We Thought",
                  thumbUrlString: "ItsWorseThanWeThought",
                  channelName: "TechLinked",
                  views: 500,
                  channelImageUrlString: "channelImageName"),
            Video(title: "ASUS pulls a Trust Me Bro",
                  thumbUrlString: "ASUSPullsATrustMeBro",
                  channelName: "TechLinked",
                  views: 468,
                  channelImageUrlString: "channelImageName"),
            Video(title: "Google Must Win the AI Wars",
                  thumbUrlString: "GoogleMustWinTheAIWars",
                  channelName: "TechLinked",
                  views: 401,
                  channelImageUrlString: "channelImageName"),
            Video(title: "What Has Canada Done? ",
                  thumbUrlString: "WhatHasCanadaDone",
                  channelName: "TechLinked",
                  views: 415,
                  channelImageUrlString: "channelImageName"),
            Video(title: "Poor Microsoft",
                  thumbUrlString: "PoorMicrosoft",
                  channelName: "TechLinked",
                  views: 525,
                  channelImageUrlString: "channelImageName"),
            Video(title: "Ryzen is a FIRE HAZARD",
                  thumbUrlString: "RyzenFireHazard",
                  channelName: "TechLinked",
                  views: 420,
                  channelImageUrlString: "channelImageName")
        ]
    }
}
