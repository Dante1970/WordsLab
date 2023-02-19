//
//  SignUpView.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 18.02.2023.
//

import UIKit

final class SignUpView: UIView {
    
    private var iconClick = true
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = self.bounds
        scrollView.contentSize = .zero
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = .zero
        return contentView
    }()
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Hello,"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up !"
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
    
    let userNameTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "USER NAME", attributes: [NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = BaseColors.gray?.cgColor
        textField.textColor = BaseColors.white
        textField.indent(size: 30)
        textField.tag = 0
        return textField
    }()
    
    let emailTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "EMAIL ADDRESS", attributes: [NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = BaseColors.gray?.cgColor
        textField.textColor = BaseColors.white
        textField.indent(size: 30)
        textField.tag = 1
        return textField
    }()
    
    let passwordTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor: BaseColors.gray!])
        textField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = BaseColors.gray?.cgColor
        textField.textColor = BaseColors.white
        textField.indent(size: 30)
        textField.isSecureTextEntry = true
        textField.tag = 2
        return textField
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameTF, emailTF, passwordTF])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var imageIcon: UIImageView = {
       let image = UIImageView(image: UIImage(named: "closeeye"))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
        
        return image
    }()
    
    private let switchUI: UISwitch = {
        let switchUI = UISwitch()
        switchUI.isOn = true
        switchUI.onTintColor = BaseColors.blue
        return switchUI
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
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        
        scrollView.frame = self.bounds
        scrollView.contentSize = contentSize
        contentView.frame.size = contentSize
        
        signUpButton.applyGradient()
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func kbDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentSize = CGSize(width: self.bounds.size.width, height: self.bounds.size.height + kbFrameSize.height)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height - 34, right: 0)
    }
        
    @objc private func kbDidHide() {
        scrollView.contentSize = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    @objc private func hideKeyboard() {
        self.endEditing(true)
    }
    
    @objc private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(named: "openeye")
            passwordTF.isSecureTextEntry = false
        } else {
            iconClick = true
            tappedImage.image = UIImage(named: "closeeye")
            passwordTF.isSecureTextEntry = true
        }
    }

    // MARK: - makeUI
    private func makeUI() {
        
        self.backgroundColor = BaseColors.backgroundColor
        
        emailTF.delegate = self
        passwordTF.delegate = self
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(welcomeStackView)
        contentView.addSubview(textFieldStackView)
//        contentView.addSubview(rememberMeStackView)
        contentView.addSubview(whiteLine1)
        contentView.addSubview(orLabel)
        contentView.addSubview(whiteLine2)
        contentView.addSubview(socialStackView)
        contentView.addSubview(signUpButton)
        
        let eyeView = UIView()
        eyeView.addSubview(imageIcon)
        eyeView.frame = CGRect(x: 0, y: 0, width: (UIImage(named: "closeeye")!.size.width) + 25, height: UIImage(named: "closeeye")!.size.height + 10)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "closeeye")!.size.width + 15, height: UIImage(named: "closeeye")!.size.height + 10)
        
        passwordTF.rightView = eyeView
        passwordTF.rightViewMode = .always
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            welcomeStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            welcomeStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            welcomeStackView.heightAnchor.constraint(equalToConstant: 100),
            
            userNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            emailTF.heightAnchor.constraint(equalToConstant: 50),

            passwordTF.heightAnchor.constraint(equalToConstant: 50),

            textFieldStackView.topAnchor.constraint(lessThanOrEqualTo: welcomeStackView.bottomAnchor, constant: 80),
            textFieldStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            whiteLine1.heightAnchor.constraint(equalToConstant: 2),
            whiteLine1.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            whiteLine1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            whiteLine1.rightAnchor.constraint(equalTo: orLabel.leftAnchor, constant: -10),
            
            orLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 50),
            
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
            
            socialStackView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            socialStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            
            signUpButton.topAnchor.constraint(equalTo: socialStackView.bottomAnchor, constant: 80),
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            signUpButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -35)
        ])
    }
}

// MARK: - extension
extension SignUpView: UITextFieldDelegate {
    
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
