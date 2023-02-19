//
//  LogInManager.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation
import FirebaseAuth

class LoginManager {
    
    static let shared = LoginManager()
    
    func loginWithCredentials(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            
            if error != nil {
                print("Error occured")
                return
            }
            
            if user != nil {
                print("Sign In")
                return
            }
            
            print("No such user")
        }
    }
}
