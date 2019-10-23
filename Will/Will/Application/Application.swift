//
//  Application.swift
//  Will
//
//  Created by Edric D. on 8/31/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()
    
    private let networkUseCaseProvider: UseCaseProvider
    
    private init() {
        networkUseCaseProvider = UseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow ) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let moviesNavigationController = UINavigationController()
        moviesNavigationController.tabBarItem = UITabBarItem(title: "MOVIES",
                                                             image: UIImage(named: "moviesIcon"),
                                                             selectedImage: UIImage(named: "moviesIconSelected"))
        
        
        let moviesNavigator = MoviesNavigator(services: networkUseCaseProvider, storyboard: storyboard, navigationController: moviesNavigationController)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintAdjustmentMode = .normal
        tabBarController.tabBar.tintColor = UIColor(hue:0.98, saturation:0.89, brightness:0.84, alpha:1.00)
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        tabBarController.viewControllers = [
            moviesNavigationController
        ]
        window.rootViewController = tabBarController
        
        moviesNavigator.toMovies()
    }
}
