//
//  TVShowsViewModel.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import RxCocoa
import RxSwift

final class TVShowsViewModel: ViewModelType {
    
    struct Input {
        let trigger: Driver<Void>
        let selectionTopRated: Driver<IndexPath>
        let selectionPopular: Driver<IndexPath>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        
        let topRatedTVShows: Driver<[TVShowItemViewModel]>
        let popularTVShows: Driver<[TVShowItemViewModel]>
        
        let selectedTopRated: Driver<TVShow>
        let selectedPopular: Driver<TVShow>
        
        let error: Driver<Error>
    }
    
    private let useCase: TVShowUseCase
    private let navigator: TVShowsNavigator
    
    init(useCase: TVShowUseCase, navigator: TVShowsNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    
    func transform(input: TVShowsViewModel.Input) -> TVShowsViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let topRatedTVShows = input.trigger.flatMapLatest {
            self.useCase.topRated()
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map { $0.map { TVShowItemViewModel(with: $0) } }
        }
        
        let popularTVShows = input.trigger.flatMapLatest {
            self.useCase.popular()
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map { $0.map { TVShowItemViewModel(with: $0) } }
        }
        
        let selectedTopRated = input.selectionTopRated
            .withLatestFrom(topRatedTVShows) { (indexPath, tvShows) -> TVShow in
                tvShows[indexPath.row].tvShow
            }.do(onNext: navigator.toTVShowDetail)
        
        let selectedPopular = input.selectionPopular
            .withLatestFrom(popularTVShows) { (indexPath, popular) -> TVShow in
                popular[indexPath.row].tvShow
            }.do(onNext: navigator.toTVShowDetail)
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        
        return Output(fetching: fetching,
                      topRatedTVShows: topRatedTVShows,
                      popularTVShows: popularTVShows,
                      selectedTopRated: selectedTopRated,
                      selectedPopular: selectedPopular,
                      error: errors)
    }
}
