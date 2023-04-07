//
//  HomeViewViewModelType.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.02.2023.
//

import Foundation

protocol HomeCellViewModelType: AnyObject {
    
    var name: String { get }
    var folder: FolderModel? { get }
    var date: String { get }
}
