//
//  ProfileViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation

class ProfileViewModel {
    
    weak var coordinator: ProfileCoordinator!
    
    func goToWelcome() {
        coordinator.signOut()
    }
}
