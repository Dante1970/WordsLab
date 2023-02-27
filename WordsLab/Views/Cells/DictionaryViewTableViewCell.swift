//
//  DictionaryTableViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class DictionaryViewTableViewCell: UITableViewCell {

    static let identifier = "DictionaryViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        
    }
    
    private func setupConstraints() {
        
    }
}
