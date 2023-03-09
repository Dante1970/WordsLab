//
//  LoginViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation

class LoginViewModel {
    
    weak var coordinator: AuthCoordinator!
    
    func login(email: String?, password: String?) {
        
//        guard let email = email,
//              let password = password,
//              email != "",
//              password != "" else {
//            print("Error! Wrong email or password.")
//            return
//        }
//        
//        let result = LoginManager.shared.loginWithCredentials(email: email, password: password)
        
        goToHome()
    }
    
    func goToHome() {
        coordinator.goToHome()
    }
}
