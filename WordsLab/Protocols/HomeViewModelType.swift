//
//  HomeViewModelType.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.02.2023.
//

import Foundation

protocol HomeViewModelType {
    
    var numberOfWords: Int { get set }
    var countOfRecentDictionaries: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCellViewModelType?
}
