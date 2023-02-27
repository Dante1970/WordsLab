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
        tableView.backgroundColor = .red
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
