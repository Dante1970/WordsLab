//
//  DictionariesViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class DictionariesViewController: UIViewController {
    
    var viewModel: DictionariesViewModel!
    
    override func loadView() {
        self.view = DictionariesView()
    }
    
    private var mainView: DictionariesView {
         guard let customView = view as? DictionariesView else {
             fatalError("Expected view to be of type \(DictionariesView.self) but got \(type(of: view)) instead")
         }
         return customView
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.dictionariesViewTableView.delegate = self
        mainView.dictionariesViewTableView.dataSource = self
    }
    
    @objc private func addNewDictionary() {
        print("click!")
        viewModel.coordinator.goToAddNewDictionary()
    }
    
    deinit {
        print("DictionariesViewController deinit")
    }
}

extension DictionariesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DictionaryViewTableViewCell.identifier, for: indexPath) as? DictionaryViewTableViewCell,
            let addCell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier, for: indexPath) as? AddTableViewCell
        else {
            return UITableViewCell()
        }
        
        addCell.addButton.addTarget(self, action: #selector(addNewDictionary), for: .touchUpInside)

        if indexPath.row == 0 {
            return addCell
        }
        
        return cell
    }
}
