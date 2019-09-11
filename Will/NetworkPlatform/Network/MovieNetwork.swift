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
    
    init() {
        self.provider = MoyaProvider<WillApi>()
    }
    
    func topRated() -> Observable<[Movie]> {
        
        return .empty()
    }
    
    func nowPlaying() -> Observable<[Movie]> {
        return .empty()
    }
    
    func popular() -> Observable<[Movie]> {
        return .empty()
    }
    
    func detail(id: Int) -> Observable<MovieDetail> {
        return .empty()
    }
    
    func credits(id: Int) -> Observable<Credit> {
        return .empty()
    }
}
