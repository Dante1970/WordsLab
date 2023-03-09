//
//  WelcomeViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 03.02.2023.
//

import Foundation

class WelcomeViewModel {
    
    weak var coordinator: AuthCoordinator!
    
    func goToLogIn() {
        coordinator.goToLogInPage()
    }
    
    func goToSignUp() {
        coordinator.goToSignUpPage()
    }
}
