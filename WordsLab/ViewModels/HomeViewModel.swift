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
//        Dictionary(ownerId: "123", name: "Words from book", folder: "Folder 4", date: "10.12.23", wordPairs: ["Hello": "привет"]),
//        Dictionary(ownerId: "123", name: "Braking Bad", folder: "Folder 3", date: "12.12.23", wordPairs: ["Hello": "привет"]),
//        Dictionary(ownerId: "123", name: "Some movie", folder: "Folder 2", date: "03.09.22", wordPairs: ["Hello": "привет"]),
//        Dictionary(ownerId: "123", name: "My first words", folder: "Folder 1", date: "24.04.21", wordPairs: ["Hello": "привет"])
    ]
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCellViewModelType? {
        
        let dictionary = recentDictionaries[indexPath.row]
        
        return HomeCellViewModel(dictionary: dictionary)
    }
    
}
