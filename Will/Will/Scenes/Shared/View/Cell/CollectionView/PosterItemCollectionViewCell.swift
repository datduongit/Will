//
//  MoviesViewModel.swift
//  Will
//
//  Created by Edric D. on 9/16/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import UIKit
import Kingfisher

class PosterItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImage: SwiftShadowImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var voteImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bindMovie(_ viewModel: MovieItemViewModel, showVote: Bool) {
        titleLabel.text = viewModel.title
        posterImage.imageView.kf.setImage(with: viewModel.posterURL)
        if showVote {
            voteLabel.text = viewModel.vote
            voteLabel.isHidden = false
            voteImage.isHidden = false
        } else {
            voteLabel.isHidden = true
            voteImage.isHidden = true
        }
    }

    func bindTVShow(_ viewModel: TVShowItemViewModel) {
        titleLabel.text = viewModel.title?.uppercased()
        posterImage.imageView.kf.setImage(with: viewModel.posterURL)
        voteLabel.isHidden = true
        voteImage.isHidden = true
    }
}
