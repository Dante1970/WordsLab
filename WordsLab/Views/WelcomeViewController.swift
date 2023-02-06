//
//  ViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 30.01.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var viewModel: WelcomeViewModel!
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome to"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 1
        label.textColor = BaseColors.white
        label.textAlignment = .center
        return label
    }()
    
    private let imageLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logoWithoutBottle"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var welcomeStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [welcomeLabel, imageLogo])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private let imageBottle: UIImageView = {
        let image = UIImageView(image: UIImage(named: "magicBottle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(BaseColors.gray, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = BaseColors.gray?.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = WelcomeViewModel()
        
        makeUI()
    }
    
    override func viewDidLayoutSubviews() {
        self.loginButton.applyGradient()
    }
    
    @objc private func loginButtonAction() {
        self.navigationController?.pushViewController(viewModel.loginViewController, animated: true)
    }
    
    private func makeUI() {
        view.backgroundColor = BaseColors.backgroundColor
        
        view.addSubview(welcomeStackView)
        view.addSubview(imageBottle)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            imageLogo.heightAnchor.constraint(equalToConstant: 40),
            
            welcomeStackView.heightAnchor.constraint(equalToConstant: 100),
            welcomeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            welcomeStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            imageBottle.topAnchor.constraint(equalTo: welcomeStackView.bottomAnchor, constant: 40),
            imageBottle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            imageBottle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            loginButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -30),
            
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35)
        ])
    }
}

