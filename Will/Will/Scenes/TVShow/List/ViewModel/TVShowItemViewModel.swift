//
//  TVShowItemViewModel.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import RxSwift

final class TVShowItemViewModel {
    let tvShow: TVShow
    let title: String?
    var posterURL: URL?
    var backdropURL: URL?
    var voteAverage: String?
    
    init(with tvShow: TVShow) {
        self.tvShow = tvShow
        title = tvShow.name?.uppercased()
        if let posterPath = tvShow.posterPath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: posterPath)
            self.posterURL = imageURLBuilder.url
        }
        if let backdropURL = tvShow.backdropPath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: backdropURL)
            self.backdropURL = imageURLBuilder.url
        }
        if let voteAverage = tvShow.voteAverage {
            self.voteAverage = String(describing: voteAverage)
        } else {
            self.voteAverage = ""
        }
    }
}

