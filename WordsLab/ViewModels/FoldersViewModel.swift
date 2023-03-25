//
//  FoldersViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class FoldersViewModel {
    
    weak var coordinator: FoldersCoordinator!
    
    var folders: [FolderModel] = []
    
    func alertController(title: String, message: String, completion: @escaping () -> Void) -> UIViewController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { nameTF in
            nameTF.placeholder = "Name"
        }
        
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let alertOkAction = UIAlertAction(title: "Ok", style: .default) { [weak self] action in
            
            guard let self = self,
                  let nameFolder = alertController.textFields?.first?.text,
                  nameFolder != "" else { return }
            
            self.addFolderToStorage(name: nameFolder)
            completion()
        }
        
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancelAction)
        
        return alertController
    }
    
    private func addFolderToStorage(name: String) {
        
        guard let appCoordinator = coordinator.parentCoordinator as? AppCoordinator else { return }
        
        if let userUID = appCoordinator.userUID {
            
            let folderModel = FolderModel(name: name, ownerId: userUID)
            
            folders.append(folderModel)
            
            LocalStorageManager.shared.add(object: folderModel)
            CloudStorageManager.shared.addFolder(name: name)
        } else {
            print("No such coordinator")
        }
    }
}
