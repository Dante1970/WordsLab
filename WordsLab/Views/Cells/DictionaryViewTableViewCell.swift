//
//  DictionaryTableViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class DictionaryViewTableViewCell: UITableViewCell {

    static let identifier = "DictionaryViewTableViewCell"
    
    var viewModel: DictionaryTableViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            dictionaryName.text = viewModel.name
            folderLabel.text = viewModel.folder
            dateLabel.text = viewModel.date
        }
    }
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let folderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25 / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let folderLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let dictionaryName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = BaseColors.gray
        return label
    }()
    
    private let dictionaryImageView: UIImageView = {
        let image = UIImage(named: "dictionaryIcon")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        folderView.applyGradient()
    }
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if folderLabel.text == "" {
            folderView.layer.opacity = 0
        }
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - makeUI
    private func makeUI() {
        
        contentView.backgroundColor = BaseColors.backgroundColor
        
        contentView.addSubview(mainView)
        mainView.addSubview(folderView)
        folderView.addSubview(folderLabel)
        mainView.addSubview(dictionaryName)
        mainView.addSubview(dateLabel)
        mainView.addSubview(dictionaryImageView)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        folderView.translatesAutoresizingMaskIntoConstraints = false
        folderLabel.translatesAutoresizingMaskIntoConstraints = false
        dictionaryName.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dictionaryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            mainView.heightAnchor.constraint(equalToConstant: 85),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            folderView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            folderView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: padding),
            folderView.heightAnchor.constraint(equalToConstant: 25),
            folderView.widthAnchor.constraint(equalToConstant: 97),

            folderLabel.centerXAnchor.constraint(equalTo: folderView.centerXAnchor),
            folderLabel.centerYAnchor.constraint(equalTo: folderView.centerYAnchor),

            dictionaryName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: padding),
            dictionaryName.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),

            dateLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -padding),

            dictionaryImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -padding),
            dictionaryImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -19)
        ])
    }
}
