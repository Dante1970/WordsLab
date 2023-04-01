//
//  AddNewDictionaryViewTableViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 25.03.2023.
//

import UIKit

class AddNewDictionaryViewTableViewCell: UITableViewCell {
    
    static let identifier = "AddNewDictionaryViewTableViewCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let wordTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        textField.textColor = BaseColors.white
        textField.attributedPlaceholder = NSAttributedString(
            string: "word",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium),
                NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.tag = 1
        return textField
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.gray
        return view
    }()
    
    let translationTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        textField.textColor = BaseColors.white
        textField.attributedPlaceholder = NSAttributedString(
            string: "translation",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium),
                NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.tag = 2
        return textField
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - makeUI
    private func makeUI() {
        
        contentView.backgroundColor = BaseColors.backgroundColor
        
        contentView.addSubview(mainView)
        mainView.addSubview(wordTF)
        mainView.addSubview(separator)
        mainView.addSubview(translationTF)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        wordTF.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        translationTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainView.heightAnchor.constraint(equalToConstant: 100),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            wordTF.leadingAnchor.constraint(equalTo: separator.leadingAnchor),
            wordTF.trailingAnchor.constraint(equalTo: separator.trailingAnchor),
            wordTF.bottomAnchor.constraint(equalTo: separator.bottomAnchor, constant: -10),
            
            separator.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            
            translationTF.leadingAnchor.constraint(equalTo: separator.leadingAnchor),
            translationTF.trailingAnchor.constraint(equalTo: separator.trailingAnchor),
            translationTF.topAnchor.constraint(equalTo: separator.topAnchor, constant: 10)
        ])
    }
}
