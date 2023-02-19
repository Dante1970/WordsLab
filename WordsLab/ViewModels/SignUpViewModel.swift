//
//  SignUpViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation

class SignUpViewModel {
    
    func signUp(email: String?, password: String?) {
        
        guard let email = email,
              let password = password,
              email != "",
              password != "" else {
            print("Error! Wrong email or password.")
            return
        }
        
        SignUpManager.shared.SignUpWithCredentials(email: email, password: password)
    }
}
