//
//  MoviesViewModel.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

final class CreditsItemViewModel {
    let name: String?
    let job: String?
    var profileURL: URL?

    init(with castCrew: CastCrew?) {
        self.name = castCrew?.name
        self.job = castCrew?.job
        if let profilePath = castCrew?.profilePath {
            let imageURLBuilder = ImageURLBuilder(imageURLType: .original, path: profilePath)
            self.profileURL = imageURLBuilder.url
        }
    }
}
