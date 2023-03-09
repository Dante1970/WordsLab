//
//  ProfileCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToProfile()
    }
    
    func signOut() {
        
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.goToAuth()
        parentCoordinator?.childDidFinish(self)
    }
    
    private func goToProfile() {
        
        let profileViewController = ProfileViewController()
        let profileViewModel = ProfileViewModel()
        profileViewModel.coordinator = self
        profileViewController.viewModel = profileViewModel
        navigationController.pushViewController(profileViewController, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit profile coordinator")
    }
}
