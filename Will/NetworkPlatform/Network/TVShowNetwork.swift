//
//  TVShowNetwork.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import RxCocoa
import RxSwift
import Moya

protocol TVShowNetworkProtocol {
    func topRated() -> Observable<[TVShow]>
    func popular() -> Observable<[TVShow]>
    func detail(id: Int) -> Observable<TVShowDetail>
    func credit(id: Int) -> Observable<Credit>
    func videos(id: Int) -> Observable<[Video]>
}

final class TVShowNetwork: TVShowNetworkProtocol {
    
    let provider: MoyaProvider<WillApi>
    
    public init() {
        self.provider = MoyaProvider<WillApi>()
    }
    
    func topRated() -> Observable<[TVShow]> {
        return provider.rx.request(.tvShowTopRated)
            .filterSuccessfulStatusCodes()
            .debug()
            .map([TVShow].self, atKeyPath: "results")
            .asObservable()
    }
    
    func popular() -> Observable<[TVShow]> {
        return provider.rx.request(.tvShowPopular)
            .filterSuccessfulStatusCodes()
            .debug()
            .map([TVShow].self, atKeyPath: "results")
            .asObservable()
    }
    
    func detail(id: Int) -> Observable<TVShowDetail> {
        return provider.rx.request(.tvShowDetail(id: id))
            .filterSuccessfulStatusCodes()
            .debug()
            .map(TVShowDetail.self)
            .asObservable()
    }
    
    func credit(id: Int) -> Observable<Credit> {
        return provider.rx.request(.tvShowCredits(id: id))
            .filterSuccessfulStatusCodes()
            .debug()
            .map(Credit.self)
            .asObservable()
    }
    
    func videos(id: Int) -> Observable<[Video]> {
        return provider.rx.request(.tvShowVideos(id: id))
            .filterSuccessfulStatusCodes()
            .debug()
            .map([Video].self, atKeyPath: "results")
            .asObservable()
    }
    

    
}
