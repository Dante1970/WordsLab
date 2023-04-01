//
//  RecentDictionaryCollectionViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class RecentDictionaryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecentDictionaryCollectionViewCell"
    
    weak var viewModel: HomeCellViewModelType? {
        willSet(viewModel) {
            
            guard let viewModel = viewModel else { return }
            
            dictionaryName.text = viewModel.name
            folderLabel.text = viewModel.folder?.name
            dateLabel.text = viewModel.date
        }
    }
    
    private let folderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25 / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let folderLabel: UILabel = {
        let label = UILabel()
        label.text = "Folder 1"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let dictionaryName: UILabel = {
        let label = UILabel()
        label.text = "Dictionary 1"
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
    
    private let dictionaryImageView: UIImageView = {
        let image = UIImage(named: "dictionaryIcon")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        folderView.applyGradient()
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
        
        contentView.addSubview(folderView)
        folderView.addSubview(folderLabel)
        contentView.addSubview(dictionaryName)
        contentView.addSubview(dateLabel)
        contentView.addSubview(dictionaryImageView)
    }
    
    private func setupConstraints() {
        
        folderView.translatesAutoresizingMaskIntoConstraints = false
        folderLabel.translatesAutoresizingMaskIntoConstraints = false
        dictionaryName.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dictionaryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            
            folderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            folderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            folderView.heightAnchor.constraint(equalToConstant: 25),
            folderView.widthAnchor.constraint(equalToConstant: 97),
            
            folderLabel.centerXAnchor.constraint(equalTo: folderView.centerXAnchor),
            folderLabel.centerYAnchor.constraint(equalTo: folderView.centerYAnchor),
            
            dictionaryName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            dictionaryName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            dictionaryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            dictionaryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19)
        ])
    }
}
