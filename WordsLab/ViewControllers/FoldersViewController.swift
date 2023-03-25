//
//  FoldersViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class FoldersViewController: UIViewController {
    
    var viewModel: FoldersViewModel!
    
    override func loadView() {
        self.view = FoldersView()
    }
    
    private var mainView: FoldersView {
         guard let customView = view as? FoldersView else {
             fatalError("Expected view to be of type \(FoldersView.self) but got \(type(of: view)) instead")
         }
         return customView
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.foldersViewTableView.delegate = self
        mainView.foldersViewTableView.dataSource = self
    }
    
    @objc private func addFolder() {
        
        let alertController = viewModel.alertController(title: "Add new folder", message: "Write the name of the folder") { [weak self] in
            guard let self = self else { return }
            
            self.mainView.foldersViewTableView.reloadData()
        }
        self.present(alertController, animated: true)
    }
    
    deinit {
        print("FoldersViewController deinit")
    }
}

extension FoldersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfFolders = viewModel.folders.count
        
        return numberOfFolders >= 1 ? numberOfFolders + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let addCell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier, for: indexPath) as? AddTableViewCell,
            let cell = tableView.dequeueReusableCell(withIdentifier: FoldersViewTableViewCell.identifier, for: indexPath) as? FoldersViewTableViewCell
        else {
            return UITableViewCell()
        }
        
        addCell.addButton.addTarget(self, action: #selector(addFolder), for: .touchUpInside)

        if indexPath.row == 0 {
            return addCell
        } else {
            let name = viewModel.folders[indexPath.row - 1].name
            cell.nameFolderLabel.text = name
        }
        
        return cell
    }
}
