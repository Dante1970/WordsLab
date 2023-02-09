//
//  LoginViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 03.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    
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
        textField.tag = 0
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
        textField.tag = 1
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        
        makeUI()
    }
    
    override func viewDidLayoutSubviews() {
        self.loginButton.applyGradient()
    }
    
    
    
    @objc private func kbDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height - 34, right: 0)
    }
        
    @objc private func kbDidHide() {
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    private func makeUI() {
        view.backgroundColor = BaseColors.backgroundColor
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(welcomeStackView)
        contentView.addSubview(textFieldStackView)
        contentView.addSubview(rememberMeStackView)
        contentView.addSubview(whiteLine1)
        contentView.addSubview(orLabel)
        contentView.addSubview(whiteLine2)
        contentView.addSubview(socialStackView)
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([

            welcomeStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            welcomeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            welcomeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            welcomeStackView.heightAnchor.constraint(equalToConstant: 100),

            emailTF.heightAnchor.constraint(equalToConstant: 50),

            passwordTF.heightAnchor.constraint(equalToConstant: 50),

            textFieldStackView.topAnchor.constraint(lessThanOrEqualTo: welcomeStackView.bottomAnchor, constant: 80),
            textFieldStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            rememberMeStackView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 20),
            rememberMeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            rememberMeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            whiteLine1.heightAnchor.constraint(equalToConstant: 2),
            whiteLine1.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            whiteLine1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            whiteLine1.rightAnchor.constraint(equalTo: orLabel.leftAnchor, constant: -10),

            orLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: rememberMeStackView.bottomAnchor, constant: 50),

            whiteLine2.heightAnchor.constraint(equalToConstant: 2),
            whiteLine2.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            whiteLine2.leftAnchor.constraint(equalTo: orLabel.rightAnchor, constant: 10),
            whiteLine2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),

            googleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.widthAnchor.constraint(equalTo: googleButton.heightAnchor),

            facebookButton.heightAnchor.constraint(equalTo: googleButton.heightAnchor),
            facebookButton.widthAnchor.constraint(equalTo: googleButton.heightAnchor),

            appleButton.heightAnchor.constraint(equalTo: googleButton.heightAnchor),
            appleButton.widthAnchor.constraint(equalTo: googleButton.heightAnchor),

            socialStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            socialStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),

            loginButton.topAnchor.constraint(equalTo: socialStackView.bottomAnchor, constant: 80),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -35)
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
