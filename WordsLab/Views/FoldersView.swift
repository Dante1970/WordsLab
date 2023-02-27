//
//  FoldersView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class FoldersView: UIView {
    
    let foldersViewTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(FoldersViewTableViewCell.self, forCellReuseIdentifier: FoldersViewTableViewCell.identifier)
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: AddTableViewCell.identifier)
        tableView.backgroundColor = .red
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foldersViewTableView.frame = self.bounds
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
        
        self.backgroundColor = BaseColors.backgroundColor
        foldersViewTableView.backgroundColor = .clear
        
        self.addSubview(foldersViewTableView)
    }
    
    private func setupConstraints() {
        
    }
}
