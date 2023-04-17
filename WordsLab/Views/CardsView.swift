//
//  CardsView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 02.04.2023.
//

import Foundation
import UIKit

class CardsView: UIView {
    
    let cardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let itemSize = CGSize(width: UIScreen.main.bounds.width - 90, height: 400)
        layout.itemSize = itemSize
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: CardsCollectionViewCell.identifier)
        
        let centerMainView = UIScreen.main.bounds.width / 2 - itemSize.width / 2
        collectionView.contentInset = UIEdgeInsets(top: 0, left: centerMainView, bottom: 0, right: centerMainView)
        
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 0
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = BaseColors.gray
        pageControl.currentPageIndicatorTintColor = BaseColors.blue
        return pageControl
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - makeUI
    private func makeUI() {
        
        self.backgroundColor = BaseColors.backgroundColor
        
        self.addSubview(cardsCollectionView)
        self.addSubview(pageControl)
    }
    
    private func setupConstraints() {
        cardsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardsCollectionView.heightAnchor.constraint(equalToConstant: 400),
            cardsCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardsCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cardsCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            pageControl.topAnchor.constraint(equalTo: cardsCollectionView.bottomAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
