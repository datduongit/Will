//
//  NetworkProvider.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import Moya

protocol NetworkProviderProtocol {
    func makeMovieNetwork() -> MovieNetwork
    func makeTVShowNetwork() -> TVShowNetwork
}

final class NetworkProvider: NetworkProviderProtocol {
    
    init() {}
    
    func makeMovieNetwork() -> MovieNetwork {
        return MovieNetwork()
    }
    
    func makeTVShowNetwork() -> TVShowNetwork {
        return TVShowNetwork()
    }
    
}
