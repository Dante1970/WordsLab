//
//  AddNewDictionaryView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 25.03.2023.
//

import UIKit

class AddNewDictionaryView: UIView {
    
    let nameTF: UITextField = {
       let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold),
                NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.textColor = BaseColors.blue
        return textField
    }()
    
    private let blueLine: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [blueLine, nameTF])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(AddNewDictionaryViewTableViewCell.self, forCellReuseIdentifier: AddNewDictionaryViewTableViewCell.identifier)
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: AddTableViewCell.identifier)
        tableView.separatorColor = .clear
        return tableView
    }()
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        blueLine.applyGradient()
    }
    
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
        
        self.addSubview(nameStackView)
        self.addSubview(tableView)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        blueLine.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            blueLine.heightAnchor.constraint(equalToConstant: 34),
            blueLine.widthAnchor.constraint(equalToConstant: 5),
            
            nameStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            nameStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36),
            nameStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            
            tableView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
