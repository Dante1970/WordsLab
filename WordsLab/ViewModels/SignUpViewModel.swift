//
//  SignUpViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation

class SignUpViewModel {
    
    weak var coordinator: AuthCoordinator!
    
    func signUp(name: String?, email: String?, password: String?) {
        
        guard let email = email,
              let password = password,
              let name = name,
              name != "",
              email != "",
              password != "" else {
            print("Error! Wrong email, password or name.")
            return
        }
        
        AuthManager.shared.SignUpWithCredentials(email: email, password: password) { [weak self] result in
            
            guard self != nil else { return }
            
            switch result {
            case .success:
                CloudStorageManager.shared.createUser(name: name)
                self!.goToHome()
            case.failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    func goToHome() {
        coordinator.goToHome()
    }
}
