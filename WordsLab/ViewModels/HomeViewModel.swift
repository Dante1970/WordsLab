//
//  HomeViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.02.2023.
//

import Foundation

class HomeViewModel: HomeViewModelType {
    
    weak var coordinator: HomeCoordinator!
    
    var numberOfWords: Int = 123
    
    var countOfRecentDictionaries: Int {
        return recentDictionaries.count
    }
    
    private var recentDictionaries: [Dictionary] = [
        Dictionary(name: "Words from book", folder: "Folder 4", date: "10.12.23"),
        Dictionary(name: "Braking Bad", folder: "Folder 3", date: "12.12.23"),
        Dictionary(name: "Some movie", folder: "Folder 2", date: "03.09.22"),
        Dictionary(name: "My first words", folder: "Folder 1", date: "24.04.21")
    ]
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCellViewModelType? {
        
        let dictionary = recentDictionaries[indexPath.row]
        
        return HomeCellViewModel(dictionary: dictionary)
    }
    
}
