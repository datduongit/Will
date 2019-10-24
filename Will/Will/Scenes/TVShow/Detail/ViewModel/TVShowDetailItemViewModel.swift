//
//  TVShowDetailItemViewModel.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

final class TVShowDetailItemViewModel {
    let title: String
    let overview: String
    let homePage: String
    let tvShowDetail: TVShowDetail
    var genres: String = ""
    var popularity: String = ""
    let vote: String
    var backdropURL: URL?
    var posterURL: URL?
    
    init(with tvShowDetail: TVShowDetail) {
        self.tvShowDetail = tvShowDetail
        if let genres = tvShowDetail.genres {
            let genresString = genres.map {
                "\($0.name ?? "")"
            }
            self.genres = genresString.joined(separator: " , ")
        }
        if let popularity = tvShowDetail.popularity {
            self.popularity = "\(popularity) People watching"
        }
        self.title = tvShowDetail.name?.uppercased() ?? ""
        self.overview = tvShowDetail.overview ?? ""
        self.homePage = tvShowDetail.homepage ?? ""
        self.vote = tvShowDetail.voteAverage?.description ?? ""
        if let backdropURL = tvShowDetail.backdropPath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: backdropURL)
            self.backdropURL = imageURLBuilder.url
        }
        if let posterPath = tvShowDetail.posterPath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: posterPath)
            self.posterURL = imageURLBuilder.url
        }
    }
}
