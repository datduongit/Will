//
//  Movie.swift
//  Will
//
//  Created by Edric D. on 9/2/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let voteCount: Int?
    public let id: Int
    let video: Bool?
    public let voteAverage: Double?
    public let title: String?
    let popularity: Double?
    public let posterPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIDS: [Int]?
    public let backdropPath: String?
    let adult: Bool?
    public let overview, releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}
