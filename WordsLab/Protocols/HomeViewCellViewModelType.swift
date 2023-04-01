//
//  HomeViewViewModelType.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.02.2023.
//

import Foundation

protocol HomeCellViewModelType: class {
    
    var name: String { get }
    var folder: FolderModel? { get }
    var date: String { get }
}
