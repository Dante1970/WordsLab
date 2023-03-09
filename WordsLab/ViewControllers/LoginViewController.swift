//
//  LoginViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 03.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel!
    
    override func loadView() {
        self.view = LoginView()
    }
    
    private var mainView: LoginView {
         guard let customView = view as? LoginView else {
             fatalError("Expected view to be of type \(LoginView.self) but got \(type(of: view)) instead")
         }
         return customView
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAction()
    }
    
    @objc private func loginButtonAction() {
        viewModel?.login(email: mainView.emailTF.text, password: mainView.passwordTF.text)
    }
    
    private func addAction() {
        mainView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    deinit {
        print("LoginViewController deinit")
    }
}
