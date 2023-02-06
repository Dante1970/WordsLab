//
//  LoginViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 03.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome Back,"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In !"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private lazy var welcomeStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [welcomeLabel, logInLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let emailTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "EMAIL ADDRESS", attributes: [NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = BaseColors.gray?.cgColor
        textField.textColor = BaseColors.white
        textField.indent(size: 30)
        return textField
    }()
    
    private let passwordTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = BaseColors.gray?.cgColor
        textField.textColor = BaseColors.white
        textField.indent(size: 30)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTF, passwordTF])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private let switchUI: UISwitch = {
        let switchUI = UISwitch()
        switchUI.isOn = true
        switchUI.onTintColor = BaseColors.blue
        return switchUI
    }()
    
    private let rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember me"
        label.textColor = BaseColors.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let forgetPasswordLabel: UIButton = {
        var plain = UIButton.Configuration.plain()
        plain.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        plain.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 15, weight: .regular)
              return outgoing
        })
        
        let button = UIButton(configuration: plain, primaryAction: nil)
        button.setTitle("forget password", for: .normal)
        button.tintColor = BaseColors.blue
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    private lazy var rememberMeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [switchUI, rememberMeLabel, forgetPasswordLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.contentMode = .scaleToFill
        return stackView
    }()
    
    private let whiteLine1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = BaseColors.white
        return view
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "OR"
        label.textColor = BaseColors.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let whiteLine2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = BaseColors.white
        return view
    }()
    
    private let googleButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.image = UIImage(named: "google-logo")
        filled.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
        filled.background.backgroundColor = BaseColors.backgroundForBlocks
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        return button
    }()
    
    private let facebookButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.image = UIImage(named: "facebook-logo")
        filled.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
        filled.imagePlacement = .trailing
        filled.background.backgroundColor = BaseColors.backgroundForBlocks
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        return button
    }()
    
    private let appleButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.image = UIImage(named: "apple-logo")
        filled.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
        filled.imagePlacement = .trailing
        filled.background.backgroundColor = BaseColors.backgroundForBlocks
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        return button
    }()
    
    private lazy var socialStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, appleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    override func viewDidLayoutSubviews() {
        self.loginButton.applyGradient()
    }
    
    private func makeUI() {
        view.backgroundColor = BaseColors.backgroundColor
        
        view.addSubview(welcomeStackView)
        view.addSubview(textFieldStackView)
        view.addSubview(rememberMeStackView)
        view.addSubview(whiteLine1)
        view.addSubview(orLabel)
        view.addSubview(whiteLine2)
        view.addSubview(socialStackView)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            welcomeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            welcomeStackView.heightAnchor.constraint(equalToConstant: 100),
            
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldStackView.topAnchor.constraint(lessThanOrEqualTo: welcomeStackView.bottomAnchor, constant: 80),
            textFieldStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            rememberMeStackView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 20),
            rememberMeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rememberMeStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            whiteLine1.heightAnchor.constraint(equalToConstant: 2),
            whiteLine1.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            whiteLine1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            whiteLine1.rightAnchor.constraint(equalTo: orLabel.leftAnchor, constant: -10),
            
            orLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: rememberMeStackView.bottomAnchor, constant: 80),
            
            whiteLine2.heightAnchor.constraint(equalToConstant: 2),
            whiteLine2.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            whiteLine2.leftAnchor.constraint(equalTo: orLabel.rightAnchor, constant: 10),
            whiteLine2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.widthAnchor.constraint(equalTo: googleButton.heightAnchor),
            
            facebookButton.heightAnchor.constraint(equalTo: googleButton.heightAnchor),
            facebookButton.widthAnchor.constraint(equalTo: googleButton.heightAnchor),
            
            appleButton.heightAnchor.constraint(equalTo: googleButton.heightAnchor),
            appleButton.widthAnchor.constraint(equalTo: googleButton.heightAnchor),
            
            socialStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            socialStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35)
        ])
    }
}
