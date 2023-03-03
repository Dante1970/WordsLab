//
//  ProfileView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 02.03.2023.
//

import UIKit

class ProfileView: UIView {
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "LogoWithBottle")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let avatarImageView: UIImageView = {
        let image = UIImage(named: "AvatarDefault")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let themeView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Theme"
        label.textColor = BaseColors.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.isOn = true
        themeSwitch.onTintColor = BaseColors.blue
        return themeSwitch
    }()
    
    private let languageView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Language"
        label.textColor = BaseColors.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var settingsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [themeView, languageView])
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = BaseColors.gray?.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func makeUI() {
        
        self.backgroundColor = BaseColors.backgroundColor
        
        self.addSubview(logoImageView)
        self.addSubview(avatarImageView)
        self.addSubview(settingsStackView)
        themeView.addSubview(themeLabel)
        themeView.addSubview(themeSwitch)
        languageView.addSubview(languageLabel)
        self.addSubview(signOutButton)
    }
    
    private func setupConstraints() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        settingsStackView.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeSwitch.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: padding),
            
            avatarImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            avatarImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            
            settingsStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 50),
            settingsStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
            settingsStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            
            themeView.heightAnchor.constraint(equalToConstant: 60),
            
            themeLabel.centerYAnchor.constraint(equalTo: themeView.centerYAnchor),
            themeLabel.leadingAnchor.constraint(equalTo: themeView.leadingAnchor, constant: padding),
            
            themeSwitch.centerYAnchor.constraint(equalTo: themeView.centerYAnchor),
            themeSwitch.trailingAnchor.constraint(equalTo: themeView.trailingAnchor, constant: -padding),
            
            languageView.heightAnchor.constraint(equalToConstant: 60),
            
            languageLabel.centerYAnchor.constraint(equalTo: languageView.centerYAnchor),
            languageLabel.leadingAnchor.constraint(equalTo: languageView.leadingAnchor, constant: padding),
            
            signOutButton.heightAnchor.constraint(equalToConstant: 60),
            signOutButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: padding),
            signOutButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            signOutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
