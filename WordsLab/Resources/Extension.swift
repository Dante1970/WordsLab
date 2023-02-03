//
//  Extension.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 02.02.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func applyGradient() {
        let lightBlue = UIColor(named: "lightBlue")!
        let blue = UIColor(named: "blue")!
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [lightBlue.cgColor, blue.cgColor]
        gradient.locations = [0.0, 1.1]
        self.layer.insertSublayer(gradient, at: 0)
    }
}
