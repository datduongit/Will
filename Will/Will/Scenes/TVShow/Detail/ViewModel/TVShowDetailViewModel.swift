//
//  TVShowDetailViewModel.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import RxSwift
import RxCocoa

final class TVShowDetailViewModel: ViewModelType {
    
    struct Input {
        let trigger: Driver<Void>
        let backButtonTrigger: Driver<Void>
        let shareButtonTrigger: Driver<Void>
        let playButtonTrigger: Driver<Void>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let tvShowDetail: Driver<TVShowDetailItemViewModel>
        let credits: Driver<[CreditsItemViewModel]>
        let dismiss: Driver<Void>
        let shareAction: Driver<TVShowDetailItemViewModel>
        let playAction: Driver<VideoItemViewModel>
        let error: Driver<Error>
    }
    
    private let tvShow: TVShow
    private let useCase: TVShowUseCase
    private let navigator: TVShowDetailNavigator
    
    init(useCase: TVShowUseCase, navigator: TVShowDetailNavigator, tvShow: TVShow) {
        self.useCase = useCase
        self.navigator = navigator
        self.tvShow = tvShow
    }
    
    func transform(input: TVShowDetailViewModel.Input) -> TVShowDetailViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        
        let tvShowDetail = input.trigger.flatMapLatest {
            self.useCase.detail(id: self.tvShow.id)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map {
                    TVShowDetailItemViewModel(with: $0)
            }
        }
        
        let credits = input.trigger.flatMapLatest {
            self.useCase.credit(id: self.tvShow.id)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map {
                    $0.crew.map {
                        CreditsItemViewModel(with: $0)
                    }
            }
        }
        
        let videos = input.trigger.flatMapLatest {
            self.useCase.videos(id: self.tvShow.id)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map {
                    VideoItemViewModel(with: $0)
            }
        }
        
        let dismiss = Driver.of(input.backButtonTrigger)
            .merge()
            .do(onNext: navigator.toTVShows)
        
        let shareAction = Driver.of(input.shareButtonTrigger)
            .merge()
            .withLatestFrom(tvShowDetail)
            .do(onNext: navigator.shareTVShowAction)
        
        let playAction = Driver.of(input.playButtonTrigger)
            .merge()
            .withLatestFrom(videos)
            .do(onNext: navigator.playVideoAction)
        
        return Output(fetching: fetching,
                      tvShowDetail: tvShowDetail,
                      credits: credits,
                      dismiss: dismiss,
                      shareAction: shareAction,
                      playAction: playAction,
                      error: errors)
    }
}
