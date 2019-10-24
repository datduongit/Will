//
//  TVShowDetailNavigator.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import UIKit
import AVKit
import XCDYouTubeKit

protocol TVShowDetailNavigatorProtocol {
    func toTVShows()
    func shareTVShowAction(_ tvShowDetail: TVShowDetailItemViewModel)
    func playVideoAction(_ video: VideoItemViewModel)
}

final class TVShowDetailNavigator: TVShowDetailNavigatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toTVShows() {
        navigationController.popViewController(animated: true)
    }
    
    func shareTVShowAction(_ tvShowDetail: TVShowDetailItemViewModel) {
        let vc = UIActivityViewController(activityItems: [tvShowDetail.title,
                                                          tvShowDetail.homePage],
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
