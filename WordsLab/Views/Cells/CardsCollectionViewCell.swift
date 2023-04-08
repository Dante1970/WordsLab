//
//  CardsCollectionViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 02.04.2023.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardsCollectionViewCell"
    
    var viewModel: CardsCellViewModelType! {
        willSet(viewModel) {
            
            guard let viewModel = viewModel else { return }
            self.label.text = viewModel.word
        }
    }
    
    private var isRotation = false
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.opacity = 1
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func flipAnimation() {
        
        let duration: TimeInterval = 0.6
        
        if !isRotation {
            
            isRotation = !isRotation
            
            UIView.transition(with: self.mainView, duration: duration, options: .transitionFlipFromLeft, animations: {
                self.label.text = self.viewModel.translation
            }, completion: nil)

        } else {
            
            isRotation = !isRotation
            
            UIView.transition(with: self.mainView, duration: duration, options: .transitionFlipFromLeft, animations: {
                self.label.text = self.viewModel.word
            }, completion: nil)
        }
    }
    
    // MARK: - makeUI
    private func makeUI() {
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        
        contentView.addSubview(mainView)
        mainView.frame = contentView.bounds
        mainView.addSubview(label)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
}
