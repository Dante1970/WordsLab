//
//  CellDelegate.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 18.04.2023.
//

import Foundation

protocol CellDelegate: AnyObject {
    
    func deleteData(at indexPath: IndexPath)
}
