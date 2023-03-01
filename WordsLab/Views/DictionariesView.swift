//
//  DictionariesView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class DictionariesView: UIView {
    
    let dictionariesViewTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(DictionaryViewTableViewCell.self, forCellReuseIdentifier: DictionaryViewTableViewCell.identifier)
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: AddTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dictionariesViewTableView.frame = self.bounds
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func makeUI() {
        
        self.backgroundColor = BaseColors.backgroundColor
        dictionariesViewTableView.backgroundColor = .clear
        
        self.addSubview(dictionariesViewTableView)
    }
}
