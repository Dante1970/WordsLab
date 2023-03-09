//
//  AuthCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToWelcomePage()
    }
    
    func goToWelcomePage() {

        let welcomeViewController = WelcomeViewController()
        let welcomeViewModel = WelcomeViewModel()
        welcomeViewModel.coordinator = self
        welcomeViewController.viewModel = welcomeViewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
    
    func goToLogInPage() {
        
        let logInViewController = LoginViewController()
        let logInViewModel = LoginViewModel()
        logInViewModel.coordinator = self
        logInViewController.viewModel = logInViewModel
        navigationController.pushViewController(logInViewController, animated: true)
    }
    
    func goToSignUpPage() {
        
        let signUpViewController = SignUpViewController()
        let signUpViewModel = SignUpViewModel()
        signUpViewModel.coordinator = self
        signUpViewController.viewModel = signUpViewModel
        navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    func goToHome() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.goToHome()
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("AuthCoordinator Deinit")
    }
}
