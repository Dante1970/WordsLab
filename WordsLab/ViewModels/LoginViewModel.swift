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
        
        guard let email = email,
              let password = password,
              email != "",
              password != "" else {
            print("Error! Wrong email or password.")
            return
        }
        
        AuthManager.shared.loginWithCredentials(email: email, password: password) { [weak self] result in
            
            switch result {
            case .success:
                self!.goToHome()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    func goToHome() {
        coordinator.goToHome()
    }
}
