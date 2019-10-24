//
//  MoviesViewModel.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

final class VideoItemViewModel {
    var key: String = ""
    let videos: [Video]?

    init(with videos: [Video]?) {
        self.videos = videos
        if let videos = videos {
            key = videos.first?.key ?? ""
        }
    }
}

