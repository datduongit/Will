//
//  MoviesViewModel.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

final class MovieDetailItemViewModel {
    let title: String
    let overview: String
    let homepage: String
    let movieDetail: MovieDetail
    var genres: String = ""
    var popularity: String = ""
    let vote: String
    var backdropURL: URL?
    var posterURL: URL?

    init(with movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
        if let genres = movieDetail.genres {
            let genresString = genres.map {
                 "\($0.name ?? "")"
            }
            self.genres = genresString.joined(separator: " , ")
        }
        if let popularity = movieDetail.popularity {
            self.popularity = "\(popularity) People watching"
        }
        self.title = movieDetail.title?.uppercased() ?? ""
        self.overview = movieDetail.overview ?? ""
        self.homepage = movieDetail.homepage ?? ""
        self.vote = movieDetail.voteAverage?.description ?? ""
        if let backdropURL = movieDetail.backdropPath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: backdropURL)
            self.backdropURL = imageURLBuilder.url
        }
        if let posterPath = movieDetail.posterPath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: posterPath)
            self.posterURL = imageURLBuilder.url
        }
    }
}


