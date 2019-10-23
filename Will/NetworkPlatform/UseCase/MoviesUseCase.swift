//
//  MoviesUseCase.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import RxSwift

final class MoviesUseCase {
    
    private let network: MovieNetwork
    
    init(network: MovieNetwork) {
        self.network = network
    }
    
    func topRated() -> Observable<[Movie]> {
        return network.topRated()
    }
    
    func nowPlaying() -> Observable<[Movie]> {
        return network.nowPlaying()
    }
    
    func popular() -> Observable<[Movie]> {
        return network.popular()
    }
    
    func detail(id: Int) -> Observable<MovieDetail> {
        return network.detail(id: id)
    }
    
    func credits(id: Int) -> Observable<Credit> {
        return network.credits(id: id)
    }
    
    func videos(id: Int) -> Observable<[Video]> {
        return network.videos(id: id)
    }
}
