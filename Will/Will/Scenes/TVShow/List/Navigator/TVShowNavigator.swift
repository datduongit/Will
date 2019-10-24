//
//  TVShowNavigator.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import UIKit

protocol TVShowNavigatorProtocol {
    func toTVShows()
    func toTVShowDetail(_ tvShow: TVShow)
}

class TVShowsNavigator: TVShowNavigatorProtocol {
    
    private let services: UseCaseProvider
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    
    init(services: UseCaseProvider, storyboard: UIStoryboard, navigationController: UINavigationController) {
        self.services = services
        self.storyboard = storyboard
        self.navigationController = navigationController
    }
    
    func toTVShows() {
        let vc = storyboard.instantiateViewController(ofType: TVShowsViewController.self)
        vc.viewModel = TVShowsViewModel(useCase: services.makeTVShowUseCase(), navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toTVShowDetail(_ tvShow: TVShow) {
        let navigator = TVShowDetailNavigator(navigationController: navigationController)
        let viewModel = TVShowDetailViewModel(useCase: services.makeTVShowUseCase(), navigator: navigator, tvShow: tvShow)
        let vc = storyboard.instantiateViewController(ofType: DetailViewController.self)
        vc.viewModelTVShow = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
}
