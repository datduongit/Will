//
//  PopularTVShowsTableViewCell.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import Kingfisher

class PopularTVShowsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backdropImage: SwiftShadowImageView!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func bind(_ viewModel: TVShowItemViewModel) {
        backdropImage.imageView.kf.setImage(with: viewModel.backdropURL)
        voteLabel.text = viewModel.voteAverage
        titleLabel.text = viewModel.title?.uppercased()
    }
    
}
