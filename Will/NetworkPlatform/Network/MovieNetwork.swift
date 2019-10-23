//
//  MovieNetwork.swift
//  Will
//
//  Created by Edric D. on 9/2/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol MovieNetworkProtocol {
    func topRated() -> Observable<[Movie]>
    func nowPlaying() -> Observable<[Movie]>
    func popular() -> Observable<[Movie]>
    func detail(id: Int) -> Observable<MovieDetail>
    func credits(id: Int) -> Observable<Credit>
}

final class MovieNetwork: MovieNetworkProtocol {
    
    let provider: MoyaProvider<WillApi>
    
    public init() {
        self.provider = MoyaProvider<WillApi>()
    }
    
    public func topRated() -> Observable<[Movie]> {
        return provider.rx.request(.movieTopRated)
            .filterSuccessfulStatusCodes()
            .debug()
            .map([Movie].self, atKeyPath: "results")
            .asObservable()
    }
    
    public func nowPlaying() -> Observable<[Movie]> {
        return provider.rx.request(.movieNowPlaying)
            .filterSuccessfulStatusCodes()
            .debug()
            .map([Movie].self, atKeyPath: "results")
            .asObservable()
    }
    
    public func popular() -> Observable<[Movie]> {
        return provider.rx.request(.moviePopular)
            .filterSuccessfulStatusCodes()
            .debug()
            .map([Movie].self, atKeyPath: "results")
            .asObservable()
    }
    
    public func detail(id: Int) -> Observable<MovieDetail> {
        return provider.rx.request(.movieDetail(id: id))
            .filterSuccessfulStatusCodes()
            .debug()
            .map(MovieDetail.self)
            .asObservable()
    }
    
    public func credits(id: Int) -> Observable<Credit> {
        return provider.rx.request(.movieCredits(id: id))
            .filterSuccessfulStatusCodes()
            .debug()
            .map(Credit.self)
            .asObservable()
    }
    
    public func videos(id: Int) -> Observable<[Video]> {
        return provider.rx.request(.movieVideos(id: id))
            .filterSuccessfulStatusCodes()
            .debug()
            .map([Video].self, atKeyPath: "results")
            .asObservable()
    }
}
