//
//  RecentDictionaryCollectionViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class RecentDictionaryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecentDictionaryCollectionViewCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        contentView.backgroundColor = BaseColors.backgroundForBlocks
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
    }
    
    private func setupConstraints() {
        
    }
}
