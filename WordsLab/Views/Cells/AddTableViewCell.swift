//
//  AddTableViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class AddTableViewCell: UITableViewCell {

    static let identifier = "AddTableViewCell"
    
    let addButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "PlusIcon")
        button.setImage(image, for: .normal)
        button.layer.borderColor = BaseColors.gray?.cgColor
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyDash(button: addButton)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        
        contentView.backgroundColor = BaseColors.backgroundColor
        contentView.addSubview(addButton)
    }
    
    private func setupConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func applyDash(button: UIButton) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = BaseColors.gray?.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineDashPattern = [3, 3]
        
        button.layoutIfNeeded()
        let path = UIBezierPath(roundedRect: button.bounds, cornerRadius: 19)
        shapeLayer.path = path.cgPath
        button.layer.insertSublayer(shapeLayer, at: 0)
    }
}
