//
//  AuthManager.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 13.03.2023.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    func getUID() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    func isUserLoggedIn() -> Bool {
        
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
    
    func loginWithCredentials(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }
    
    func SignUpWithCredentials(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }
    
    func signOut() -> Bool {
        
        do {
            try Auth.auth().signOut()
            return true
        } catch let signOutError as NSError {
            print("Ошибка при выходе из учетной записи: %@", signOutError)
            return false
        }
    }
}
