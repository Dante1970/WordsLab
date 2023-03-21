//
//  FoldersCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class FoldersCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToFolders()
    }
    
    private func goToFolders() {
        
        let foldersViewController = FoldersViewController()
        let foldersViewModel = FoldersViewModel()
        foldersViewModel.coordinator = self
        foldersViewModel.folders = LocalStorageManager.shared.obtainFolders()
        foldersViewController.viewModel = foldersViewModel
        navigationController.pushViewController(foldersViewController, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit folders coordinator")
    }
}
