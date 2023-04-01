//
//  AddNewDictionaryViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 25.03.2023.
//

import UIKit

class AddNewDictionaryViewController: UIViewController {
    
    var viewModel: AddNewDictionaryViewModel!
    
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
        
        addDoneButton()
    }
    
    private func addDoneButton() {
        let navigationItem = self.navigationItem
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.setRightBarButton(item, animated: true)
    }
    
    @objc private func doneTapped() {
        
        let name = mainView.nameTF.text
        
        if name != "" {
            viewModel.doneTapped(name: mainView.nameTF.text!, cells: mainView.tableView.visibleCells)
            viewModel.coordinator.navigationController.popViewController(animated: true)
        } else {
            present(viewModel.alertOk(title: "Error!", message: "Fill in the name field"), animated: true)
        }
    }
    
    @objc private func addNewWord() {
        viewModel.addNewWord()
        mainView.tableView.reloadData()
    }
}

extension AddNewDictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AddNewDictionaryViewTableViewCell.identifier) as? AddNewDictionaryViewTableViewCell,
            let addCell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier) as? AddTableViewCell
        else {
            return UITableViewCell()
        }
        
        addCell.addButton.addTarget(self, action: #selector(addNewWord), for: .touchUpInside)

        if indexPath.row == viewModel.numberOfRows - 1 {
            return addCell
        } else {
            return cell
        }
    }
}
