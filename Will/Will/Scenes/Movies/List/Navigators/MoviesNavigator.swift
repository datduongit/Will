//
//  MoviesNavigator.swift
//  Will
//
//  Created by Edric D. on 10/23/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesNavigatorProtocol {
    func toMovies()
    func toMoviesDetail(_ movie: Movie)
}

final class MoviesNavigator: MoviesNavigatorProtocol {
    
    private let storyboard: UIStoryboard
    private let services: UseCaseProvider
    private let navigationController: UINavigationController
    
    
    init(services: UseCaseProvider, storyboard: UIStoryboard, navigationController: UINavigationController) {
        self.services = services
        self.storyboard = storyboard
        self.navigationController = navigationController
    }
    
    func toMovies() {
        let vc = storyboard.instantiateViewController(ofType: MoviesViewController.self)
        vc.viewModel = MoviesViewModel(useCase: services.makeMoviesUseCase(), navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toMoviesDetail(_ movie: Movie) {
        let navigator = MoviesDetailNavigator(navigationController: navigationController)
        let viewModel = MovieDetailViewModel(useCase: services.makeMoviesUseCase(), navigator: navigator, movie: movie)
        let vc = storyboard.instantiateViewController(ofType: DetailViewController.self)
        vc.viewModelMovie = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
