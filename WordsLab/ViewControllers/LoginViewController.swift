//
//  LoginViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 03.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func loadView() {
        self.view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func view() -> LoginView {
        return self.view as! LoginView
    }
}
