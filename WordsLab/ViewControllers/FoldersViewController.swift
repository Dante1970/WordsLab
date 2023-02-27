//
//  FoldersViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class FoldersViewController: UIViewController {
    
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
}

extension FoldersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FoldersViewTableViewCell.identifier, for: indexPath) as? FoldersViewTableViewCell,
            let addCell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier, for: indexPath) as? AddTableViewCell
        else {
            return UITableViewCell()
        }

        if indexPath.row == 0 {
            return addCell
        }
        
        return cell
    }
}
