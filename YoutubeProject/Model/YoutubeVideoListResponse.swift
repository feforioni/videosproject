//
//  YoutubeVideoListResponse.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 05/07/23.
//

import Foundation

struct YoutubeVideoListResponse: Decodable {
    var items: [Item]
}

struct Item: Decodable {
    var id: String
    var snippet: Snippet
    var statistics: Statistics
}

struct Snippet: Decodable {
    var title: String
    var description: String
    var channelTitle: String
    var channelId: String
    var thumbnails: Thumbnails
}

struct Thumbnails: Decodable {
    var highDefinitionVersion: Thumbnail
    enum CodingKeys: String, CodingKey {
        case highDefinitionVersion = "high"
    }
}

struct Thumbnail: Decodable {
    var url: String
}

struct Statistics: Decodable {
    var viewCount: String
}
