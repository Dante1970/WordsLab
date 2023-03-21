//
//  ProfileViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation

class ProfileViewModel {
    
    weak var coordinator: ProfileCoordinator!
    
    func signOut() {
        
        if AuthManager.shared.signOut() {
            coordinator.signOut()
        } else {
            print("ProfileViewModel: sign out error!")
        }
    }
}
