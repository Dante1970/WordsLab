//
//  HomeViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModelType?
    
    override func loadView() {
        self.view = HomeView()
    }
    
    private var mainView: HomeView {
         guard let customView = view as? HomeView else {
             fatalError("Expected view to be of type \(HomeView.self) but got \(type(of: view)) instead")
         }
         return customView
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.recentDictionaryCollactionView.delegate = self
        mainView.recentDictionaryCollactionView.dataSource = self
        
        viewModel = HomeViewModel()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.countOfRecentDictionaries ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentDictionaryCollectionViewCell.identifier, for: indexPath) as? RecentDictionaryCollectionViewCell
        
        guard let cell = cell, let viewModel = self.viewModel else { return UICollectionViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        cell.viewModel = cellViewModel
        
        return cell
    }
}
