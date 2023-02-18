//
//  SignUpViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 18.02.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override func loadView() {
        self.view = SignUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func view() -> SignUpView {
        return self.view as! SignUpView
    }
}
