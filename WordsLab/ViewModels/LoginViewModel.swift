//
//  LoginViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation

class LoginViewModel {
    
    func login(email: String?, password: String?) {
        
        guard let email = email,
              let password = password,
              email != "",
              password != "" else {
            print("Error! Wrong email or password.")
            return
        }
        
        LoginManager.shared.loginWithCredentials(email: email, password: password)
    }
}
