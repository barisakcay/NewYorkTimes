//
//  NewsData.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 31.05.2024.
//

import Foundation

struct NewsData: Decodable {
    let results: [News]?
}

struct News: Decodable {
    let title, abstract, url, byline: String?
    let multimedia: [Multimedia]?
}

struct Multimedia: Decodable {
    let url: String?
    let format: Format?
}

enum Format: String, Codable {
    case largeThumbnail = "Large Thumbnail"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case superJumbo = "Super Jumbo"
    case threeByTwoSmallAt2X = "threeByTwoSmallAt2X"
}
