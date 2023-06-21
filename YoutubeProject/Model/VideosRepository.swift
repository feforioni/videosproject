//
//  VideosRepository.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 19/06/23.
//

import Foundation
struct VideosRepository {
    func getVideos() -> [Video] {
        return [Video(title: "Windows is A.I. Now",
                      thumbName: "ThumbNail",
                      channelName: "TechLinked",
                      views: 475,
                      channelImageName: "channels4_profile")]
    }
}
