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
    
    func start() {
        goToAuth()
        print("start AppCoordinator")
    }
    
    func goToAuth() {
        
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        
        children.removeAll()
        
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        
        authCoordinator.start()
    }
    
    func goToHome() {
        
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
