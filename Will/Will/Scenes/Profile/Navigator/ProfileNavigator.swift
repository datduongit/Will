//
//  ProfileNavigator.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import UIKit

protocol ProfileNavigatorProtocol {
    func toProfile()
}

class ProfileNavigator: ProfileNavigatorProtocol {
    
    private let services: UseCaseProvider
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    
    init(services: UseCaseProvider, storyboard: UIStoryboard, navigationController: UINavigationController) {
        self.services = services
        self.storyboard = storyboard
        self.navigationController = navigationController
    }
    
    func toProfile() {
        let profileViewController = storyboard.instantiateViewController(ofType: ProfileViewController.self)
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
