//
//  UseCaseProvider.swift
//  Will
//
//  Created by Edric D. on 10/23/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

final class UseCaseProvider {
    
    private let networkProvider = NetworkProvider()
    
    public func makeMoviesUseCase() -> MoviesUseCase {
        return MoviesUseCase(network: networkProvider.makeMovieNetwork())
    }
    
    public func makeTVShowUseCase() -> TVShowUseCase {
        return TVShowUseCase(network: networkProvider.makeTVShowNetwork())
    }
    
}
