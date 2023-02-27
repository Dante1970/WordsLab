//
//  FoldersViewTableViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class FoldersViewTableViewCell: UITableViewCell {

    static let identifier = "FoldersViewTableViewCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImage(named: "FolderIcon")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let nameFolderLabel: UILabel = {
        let label = UILabel()
        label.text = "Folder"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "10.12.23"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = BaseColors.gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        
        contentView.backgroundColor = BaseColors.backgroundColor
        
        contentView.addSubview(mainView)
        mainView.addSubview(iconImageView)
        mainView.addSubview(nameFolderLabel)
        mainView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameFolderLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            mainView.heightAnchor.constraint(equalToConstant: 66),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            iconImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: padding),
            
            nameFolderLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            nameFolderLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            
            dateLabel.centerYAnchor.constraint(equalTo: nameFolderLabel.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: nameFolderLabel.trailingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -padding)
        ])
    }
}
