//
//  TVShowsViewController.swift
//  Will
//
//  Created by Edric D. on 10/24/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TVShowsViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    internal var viewModel: TVShowsViewModel!
    
    @IBOutlet weak private var topRatedTVShowsCollectionView: UICollectionView!
    @IBOutlet weak private var popularTVShowsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCells()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func registerCollectionViewCells() {
        topRatedTVShowsCollectionView.register(UINib(nibName: PosterItemCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: PosterItemCollectionViewCell.reuseID)
    }
    
    private func bindViewModel() {
        assert(viewModel != nil)
        
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = TVShowsViewModel.Input(trigger: viewWillAppear,
                                           selectionTopRated: topRatedTVShowsCollectionView.rx.itemSelected.asDriver(),
                                           selectionPopular: popularTVShowsTableView.rx.itemSelected.asDriver())
        
        let output = viewModel.transform(input: input)
        
        output.topRatedTVShows.drive(
            topRatedTVShowsCollectionView
                .rx.items(cellIdentifier: PosterItemCollectionViewCell.reuseID,
                          cellType: PosterItemCollectionViewCell.self)) {_, viewModel, cell in
                            cell.bindTVShow(viewModel)
            }.disposed(by: disposeBag)
        
        output.popularTVShows
            .drive(popularTVShowsTableView.rx.items(cellIdentifier: PopularTVShowsTableViewCell.reuseID, cellType: PopularTVShowsTableViewCell.self))
            { _, viewModel, cell in
                cell.bind(viewModel)
            }.disposed(by: disposeBag)
        
        output.selectedTopRated
            .drive()
            .disposed(by: disposeBag)
        
        output.selectedPopular
            .drive()
            .disposed(by: disposeBag)
    }
}
