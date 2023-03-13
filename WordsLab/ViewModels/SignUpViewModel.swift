//
//  SignUpViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation

class SignUpViewModel {
    
    weak var coordinator: AuthCoordinator!
    
    func signUp(email: String?, password: String?) {
        
        guard let email = email,
              let password = password,
              email != "",
              password != "" else {
            print("Error! Wrong email or password.")
            return
        }
        
        AuthManager.shared.SignUpWithCredentials(email: email, password: password) { [weak self] result in
            
            guard self != nil else { return }
            
            switch result {
            case .success:
                self!.goToHome()
            case.failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
        
        goToHome()
    }
    
    func goToHome() {
        coordinator.goToHome()
    }
}
