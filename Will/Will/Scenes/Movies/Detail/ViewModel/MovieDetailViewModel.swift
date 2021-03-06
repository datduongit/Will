//
//  MoviesViewModel.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class MovieDetailViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<Void>
        let backButtonTrigger: Driver<Void>
        let shareButtonTrigger: Driver<Void>
        let playButtonTrigger: Driver<Void>
    }

    struct Output {
        let fetching: Driver<Bool>
        let movieDetail: Driver<MovieDetailItemViewModel>
        let credits: Driver<[CreditsItemViewModel]>
        let dismiss: Driver<Void>
        let shareAction: Driver<MovieDetailItemViewModel>
        let playAction: Driver<VideoItemViewModel>
        let error: Driver<Error>
    }

    private let movie: Movie
    private let useCase: MoviesUseCase
    private let navigator: MoviesDetailNavigator

    init(useCase: MoviesUseCase, navigator: MoviesDetailNavigator, movie: Movie) {
        self.useCase = useCase
        self.navigator = navigator
        self.movie = movie
    }

    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()

        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()

        let movieDetail = input.trigger.flatMapLatest {
            self.useCase.detail(id: self.movie.id)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map {
                    MovieDetailItemViewModel(with: $0)
                }
        }

        let credits = input.trigger.flatMapLatest {
            self.useCase.credits(id: self.movie.id)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map {
                    $0.cast.map {
                        CreditsItemViewModel(with: $0)
                    }
                }
            
        }

        let videos = input.trigger.flatMapLatest {
            self.useCase.videos(id: self.movie.id)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map {
                    VideoItemViewModel(with: $0)
                }
        }

        let dismiss = Driver.of(input.backButtonTrigger)
                .merge()
                .do(onNext: navigator.toMovies)

        let shareAction = Driver.of(input.shareButtonTrigger)
            .merge()
            .withLatestFrom(movieDetail)
            .do(onNext: navigator.shareMovieAction)

        let playAction = Driver.of(input.playButtonTrigger)
            .merge()
            .withLatestFrom(videos)
            .do(onNext: navigator.playVideoAction)

        return Output(fetching: fetching,
                      movieDetail: movieDetail,
                      credits: credits,
                      dismiss: dismiss,
                      shareAction: shareAction,
                      playAction: playAction,
                      error: errors)
    }
}
