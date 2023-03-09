//
//  SignUpViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 18.02.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var viewModel: SignUpViewModel!
    
    override func loadView() {
        self.view = SignUpView()
    }
    
    private var mainView: SignUpView {
         guard let customView = view as? SignUpView else {
             fatalError("Expected view to be of type \(SignUpView.self) but got \(type(of: view)) instead")
         }
         return customView
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAction()
    }
    
    @objc private func signUpButtonAction() {
        viewModel.signUp(email: mainView.emailTF.text, password: mainView.passwordTF.text)
    }
    
    private func addAction() {
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
    
    deinit {
        print("SignUpViewController deinit")
    }
}
