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
                  thumbName: "ThumbNail",       //
                  channelName: "TechLinked",    //     0
                  views: 475,                   //
                  channelImageName: "channelImageName"), //
            Video(title: "A Swing And A Miss",
                  thumbName: "ASwingAndAMiss",
                  channelName: "TechLinked",
                  views: 300,
                  channelImageName: "channelImageName"),
            Video(title: "Use Crypto, Get Tracked",
                  thumbName: "UseCryptoGetTracked",
                  channelName: "TechLinked",
                  views: 325,
                  channelImageName: "channelImageName"),
            Video(title: "Our Boss Fired Himself",
                  thumbName: "OurBossFiredHimself",
                  channelName: "TechLinked",
                  views: 539,
                  channelImageName: "channelImageName"),
            Video(title: "AI is Mainstream. What Do We Do?",
                  thumbName: "AiIsaMainstream",
                  channelName: "TechLinked",
                  views: 539,
                  channelImageName: "channelImageName"),
            Video(title: "It’s Worse Than We Thought",
                  thumbName: "ItsWorseThanWeThought",
                  channelName: "TechLinked",
                  views: 500,
                  channelImageName: "channelImageName"),
            Video(title: "ASUS pulls a Trust Me Bro",
                  thumbName: "ASUSPullsATrustMeBro",
                  channelName: "TechLinked",
                  views: 468,
                  channelImageName: "channelImageName"),
            Video(title: "Google Must Win the AI Wars",
                  thumbName: "GoogleMustWinTheAIWars",
                  channelName: "TechLinked",
                  views: 401,
                  channelImageName: "channelImageName"),
            Video(title: "What Has Canada Done? ",
                  thumbName: "WhatHasCanadaDone",
                  channelName: "TechLinked",
                  views: 415,
                  channelImageName: "channelImageName"),
            Video(title: "Poor Microsoft",
                  thumbName: "PoorMicrosoft",
                  channelName: "TechLinked",
                  views: 525,
                  channelImageName: "channelImageName"),
            Video(title: "Ryzen is a FIRE HAZARD",
                  thumbName: "RyzenFireHazard",
                  channelName: "TechLinked",
                  views: 420,
                  channelImageName: "channelImageName")
        ]
    }
}
