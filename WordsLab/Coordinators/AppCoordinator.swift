//
//  AppCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    var userUID: String?
    var isLoggedIn: Bool = false
    
    func start() {
        
        isLoggedIn = AuthManager.shared.isUserLoggedIn()
        
        navigationController.pushViewController(CardsViewController(), animated: true)
//        if isLoggedIn {
//            goToHome()
//        } else {
//            goToAuth()
//        }
    }
    
    func goToAuth() {
        
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        
        children.removeAll()
        
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        
        navigationController.setNavigationBarHidden(false, animated: true)
        
        authCoordinator.start()
    }
    
    func goToHome() {
        
        if userUID == nil { userUID = AuthManager.shared.getUID() }
        
        let homeTabBarCoordinator = HomeTabBarCoordinator(navigationController: navigationController)
        
        children.removeAll()
        
        homeTabBarCoordinator.parentCoordinator = self
        children.append(homeTabBarCoordinator)
        
        homeTabBarCoordinator.start()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("AppCoordinator deinit")
    }
}
