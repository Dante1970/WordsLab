//
//  HomeView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class HomeView: UIView {
    
    private let imageLogo: UIImageView = {
        let image = UIImage(named: "LogoWithBottle")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, Sergey!"
        label.textColor = BaseColors.white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private let learnLabel: UILabel = {
        let label = UILabel()
        label.text = "Let’s learn something new!"
        label.textColor = BaseColors.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var helloLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [helloLabel, learnLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    private let avatarImage: UIImageView = {
        let image = UIImage(named: "AvatarDefault")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var helloStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [helloLabelsStackView, avatarImage])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let numberOfWordsView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let numberOfWordsLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of words"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let wordCountLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private lazy var numberOfWordsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numberOfWordsLabel, wordCountLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let recentDictionaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent dictionary"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let recentDictionaryCollactionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 80, height: 85)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RecentDictionaryCollectionViewCell.self, forCellWithReuseIdentifier: RecentDictionaryCollectionViewCell.identifier)
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        numberOfWordsView.applyGradient()
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - makeUI
    private func makeUI() {
        
        recentDictionaryCollactionView.delegate = self
        recentDictionaryCollactionView.dataSource = self
        
        self.backgroundColor = BaseColors.backgroundColor
        
        self.addSubview(imageLogo)
        self.addSubview(helloStackView)
        self.addSubview(numberOfWordsView)
        numberOfWordsView.addSubview(numberOfWordsStackView)
        self.addSubview(recentDictionaryLabel)
        self.addSubview(recentDictionaryCollactionView)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        helloStackView.translatesAutoresizingMaskIntoConstraints = false
        numberOfWordsView.translatesAutoresizingMaskIntoConstraints = false
        numberOfWordsStackView.translatesAutoresizingMaskIntoConstraints = false
        recentDictionaryLabel.translatesAutoresizingMaskIntoConstraints = false
        recentDictionaryCollactionView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageLogo.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: padding),
            
            helloStackView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 20),
            helloStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
            helloStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            
            numberOfWordsView.topAnchor.constraint(equalTo: helloStackView.bottomAnchor, constant: 40),
            numberOfWordsView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: padding),
            numberOfWordsView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -padding),
            numberOfWordsView.heightAnchor.constraint(equalToConstant: 110),
            
            numberOfWordsStackView.centerXAnchor.constraint(equalTo: numberOfWordsView.centerXAnchor),
            numberOfWordsStackView.centerYAnchor.constraint(equalTo: numberOfWordsView.centerYAnchor),
            
            recentDictionaryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
            recentDictionaryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            recentDictionaryLabel.bottomAnchor.constraint(equalTo: recentDictionaryCollactionView.topAnchor, constant: -8),
            
            recentDictionaryCollactionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            recentDictionaryCollactionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
            recentDictionaryCollactionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            recentDictionaryCollactionView.heightAnchor.constraint(equalToConstant: 190),
        ])
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentDictionaryCollectionViewCell.identifier, for: indexPath) as! RecentDictionaryCollectionViewCell
        return cell
    }
}
