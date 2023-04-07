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
    }
    
    private func setupConstraints() {
        cardsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardsCollectionView.heightAnchor.constraint(equalToConstant: 500),
            cardsCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardsCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cardsCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
