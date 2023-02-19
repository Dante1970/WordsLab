//
//  SignUpManager.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 19.02.2023.
//

import Foundation
import FirebaseAuth

class SignUpManager {
    
    static let shared = SignUpManager()
    
    func SignUpWithCredentials(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            
            if error == nil {
                if user != nil {
                    print("User created!")
                }
            }
        }
    }
}
