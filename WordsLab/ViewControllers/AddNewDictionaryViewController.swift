//
//  AddNewDictionaryViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 25.03.2023.
//

import UIKit

class AddNewDictionaryViewController: UIViewController {
    
    private let numberOfRows: Int = 2
    
    override func loadView() {
        self.view = AddNewDictionaryView()
    }
    
    private var mainView: AddNewDictionaryView {
         guard let customView = view as? AddNewDictionaryView else {
             fatalError("Expected view to be of type \(AddNewDictionaryView.self) but got \(type(of: view)) instead")
         }
         return customView
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension AddNewDictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AddNewDictionaryViewTableViewCell.identifier) as? AddNewDictionaryViewTableViewCell,
            let addCell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier) as? AddTableViewCell
        else {
            return UITableViewCell()
        }
              
        print(indexPath.row)

        if indexPath.row == numberOfRows - 1 {
            return addCell
        } else {
            return cell
        }
        
//        guard let cell = cell else { return UITableViewCell() }
        
//        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}
