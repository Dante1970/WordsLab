//
//  CardsViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 02.04.2023.
//

import UIKit

class CardsViewController: UIViewController {
    
    private var selectCard = 0
    
    override func loadView() {
        self.view = CardsView()
    }
    
    private var mainView: CardsView {
         guard let customView = view as? CardsView else {
             fatalError("Expected view to be of type \(CardsView.self) but got \(type(of: view)) instead")
         }
         return customView
     }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.cardsCollectionView.delegate = self
        mainView.cardsCollectionView.dataSource = self
    }
}

// MARK: - extension
extension CardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell
        
        guard let cell = cell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CardsCollectionViewCell {
            cell.flipAnimation()
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // Завершить перемещение
        targetContentOffset.pointee = scrollView.contentOffset
        
        let currentIndex = mainView.cardsCollectionView.indexPathsForSelectedItems?.first ?? mainView.cardsCollectionView.indexPathsForVisibleItems.first
        
        if velocity.x < 0 {
            print(velocity.x)
            selectCard -= selectCard > 0 ? 1 : 0
            mainView.cardsCollectionView.scrollToItem(at: IndexPath(item: selectCard, section: currentIndex!.section), at: .centeredHorizontally, animated: true)
        } else {
            print(velocity.x)
            selectCard += selectCard < 4 ? 1 : 0 // 4 need to change on words.count
            mainView.cardsCollectionView.scrollToItem(at: IndexPath(item: selectCard, section: currentIndex!.section), at: .centeredHorizontally, animated: true)
        }
    }
}
