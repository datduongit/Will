//
//  MoviesDetailNavigator.swift
//  Will
//
//  Created by Edric D. on 10/23/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import XCDYouTubeKit

protocol MoviesDetailNavigatorProtocol {
    func toMovies()
    func shareMovieAction(_ movie: MovieDetailItemViewModel)
    func playVideoAction(_ video: VideoItemViewModel)
}

final class MoviesDetailNavigator: MoviesDetailNavigatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMovies() {
        navigationController.popViewController(animated: true)
    }
    
    func shareMovieAction(_ movie: MovieDetailItemViewModel) {
        let vc = UIActivityViewController(activityItems: [movie.title,
                                                          movie.homepage],
                                          applicationActivities: nil)
        navigationController.present(vc, animated: true)
    }
    
    func playVideoAction(_ video: VideoItemViewModel) {
        let playerViewController = AVPlayerViewController()
        navigationController.present(playerViewController, animated: true, completion: nil)
        
        XCDYouTubeClient.default().getVideoWithIdentifier(video.key) { [weak playerViewController] (video: XCDYouTubeVideo?, error: Error?) in
            if let streamURLs = video?.streamURLs, let streamURL = (streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ?? streamURLs[YouTubeVideoQuality.hd720] ?? streamURLs[YouTubeVideoQuality.medium360] ?? streamURLs[YouTubeVideoQuality.small240]) {
                playerViewController?.player = AVPlayer(url: streamURL)
            } else {
                self.navigationController.dismiss(animated: true, completion: nil)
            }
        }
    }
}
