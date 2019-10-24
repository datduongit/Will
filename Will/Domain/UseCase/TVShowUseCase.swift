//
//  TVShowUseCase.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import RxSwift
import RxCocoa

final class TVShowUseCase {
    
    private let network: TVShowNetwork
    
    init(network: TVShowNetwork) {
        self.network = network
    }
    
    func topRated() -> Observable<[TVShow]> {
        return network.topRated()
    }
    
    func popular() -> Observable<[TVShow]> {
        return network.popular()
    }
    
    func detail(id: Int) -> Observable<TVShowDetail> {
        return network.detail(id: id)
    }
    
    func credit(id: Int) -> Observable<Credit> {
        return network.credit(id: id)
    }
    
    func videos(id: Int) -> Observable<[Video]> {
        return network.videos(id: id)
    }
    
}
