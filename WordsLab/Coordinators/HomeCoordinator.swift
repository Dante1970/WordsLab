//
//  HomeCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToHome()
    }
    
    private func goToHome() {
        
        let homeViewController = HomeViewController()
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        homeViewController.viewModel = homeViewModel
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit home coordinator")
    }
}
