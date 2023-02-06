//
//  BaseColors.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 30.01.2023.
//

import Foundation
import UIKit

class BaseColors {
    
    static let backgroundColor = UIColor(named: "backgroundColor")
    static let backgroundForBlocks = UIColor(named: "backgroundForBlocks")
    static let backgroundForIcons = UIColor(named: "backgroundForIcons")
    static let gray = UIColor(named: "gray")
    static let white = UIColor(named: "white")
    static let lightBlue = UIColor(named: "lightBlue")
    static let blue = UIColor(named: "blue")
    
    static func getGradient(for view: UIView) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [lightBlue!.cgColor, blue!.cgColor]
        gradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
