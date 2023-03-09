//
//  HomeTabBarCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class HomeTabBarCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        print("HomeTabBar Coordinator Init")
        initializeHomeTabBar()
    }
    
    private func initializeHomeTabBar() {
        
        let tabBarController = UITabBarController()
        
        // Setup for home tab
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator.parentCoordinator = parentCoordinator
        
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(named: "Home")
        homeNavigationController.tabBarItem = homeItem
        
        // Setup for folders tab
        let foldersNavigationController = UINavigationController()
        let foldersCoordinator = FoldersCoordinator(navigationController: foldersNavigationController)
        foldersCoordinator.parentCoordinator = parentCoordinator
        
        let foldersItem = UITabBarItem()
        foldersItem.title = "Folders"
        foldersItem.image = UIImage(named: "Folder")
        foldersNavigationController.tabBarItem = foldersItem
        
        // Setup for dictionaries tab
        let dictionariesNavigationController = UINavigationController()
        let dictionariesCoordinator = DictionariesCoordinator(navigationController: dictionariesNavigationController)
        dictionariesCoordinator.parentCoordinator = parentCoordinator
        
        let dictionariesItem = UITabBarItem()
        dictionariesItem.title = "Dictionaries"
        dictionariesItem.image = UIImage(named: "Dictionary")
        dictionariesNavigationController.tabBarItem = dictionariesItem
        
        // Setup for profile tab
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
        profileCoordinator.parentCoordinator = parentCoordinator
        
        let profileItem = UITabBarItem()
        profileItem.title = "Profile"
        profileItem.image = UIImage(named: "Profile")
        profileNavigationController.tabBarItem = profileItem
        
        tabBarController.viewControllers = [homeNavigationController, foldersNavigationController, dictionariesNavigationController, profileNavigationController]
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(tabBarController, animated: true)
        navigationController.setNavigationBarHidden(true, animated: true)
        
        // Add the coordinator into parent's child
        parentCoordinator?.children.append(homeCoordinator)
        parentCoordinator?.children.append(foldersCoordinator)
        parentCoordinator?.children.append(dictionariesCoordinator)
        parentCoordinator?.children.append(profileCoordinator)
        
        homeCoordinator.start()
        foldersCoordinator.start()
        dictionariesCoordinator.start()
        profileCoordinator.start()
        
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("HomeTabBar Coordinator Deinit")
    }
}
