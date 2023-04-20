//
//  DictionaryTableViewCell.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 27.02.2023.
//

import UIKit

class DictionaryViewTableViewCell: UITableViewCell {

    static let identifier = "DictionaryViewTableViewCell"
    
    weak var delegate: CellDelegate?
    
    var mainViewTopAnchor: NSLayoutConstraint?
    var mainViewHeightAnchor: NSLayoutConstraint?
    var mainViewLeadingAnchor: NSLayoutConstraint?
    var mainViewTrailingAnchor: NSLayoutConstraint?
    
    var deleteButtonWidth: NSLayoutConstraint?
    
    var viewModel: DictionaryTableViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            dictionaryName.text = viewModel.name
            folderLabel.text = viewModel.folder
            dateLabel.text = viewModel.date
        }
    }
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = BaseColors.backgroundForBlocks
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let folderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25 / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let folderLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let dictionaryName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = BaseColors.white
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = BaseColors.gray
        return label
    }()
    
    private let dictionaryImageView: UIImageView = {
        let image = UIImage(named: "dictionaryIcon")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        folderView.applyGradient()
    }
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if folderLabel.text == "" {
            folderView.layer.opacity = 0
        }
        
        makeUI()
        setupConstraints()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func deleteButtonTapped() {
        
        guard let tableView = self.superview as? UITableView,
              let indexPath = tableView.indexPath(for: self)
        else { return }
        
        deleteAnimation(indexPath: indexPath)
    }
    
    // MARK: - addGesture
    private func addGesture() {
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureLeft.direction = .left
        mainView.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureRight.direction = .right
        mainView.addGestureRecognizer(swipeGestureRight)
    }
    
    // MARK: - Animations
    private func deleteAnimation(indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: { [weak self] in
            
            guard let self = self else { return }
            
            self.mainViewTopAnchor!.constant = 1
            self.mainViewHeightAnchor!.constant = 0
            self.mainViewLeadingAnchor!.constant -= 300
            self.mainViewTrailingAnchor!.constant -= 300
            
            self.deleteButtonWidth!.constant += 300
            
            self.layoutIfNeeded()
            
            guard let tableView = self.superview as? UITableView else { return }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        }, completion: { [weak self] _ in
            
            // delete data
            
            guard let self = self else { return }
            
            self.delegate!.deleteData(at: indexPath)
        })
    }
    
    @objc private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {

        let indentForMainView: CGFloat = 90
        let deleteButtonWidth: CGFloat = 50
        let leadingConstant = self.mainViewLeadingAnchor!.constant
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            
            guard let self = self else { return }
                
            if gesture.direction == .left && leadingConstant == 20 {
                
                self.mainViewLeadingAnchor!.constant -= indentForMainView
                self.mainViewTrailingAnchor!.constant -= indentForMainView
                
                self.deleteButtonWidth!.constant += deleteButtonWidth
                
            } else if gesture.direction == .right && leadingConstant < 20 {
                
                self.mainViewLeadingAnchor!.constant += indentForMainView
                self.mainViewTrailingAnchor!.constant += indentForMainView
                
                self.deleteButtonWidth!.constant -= deleteButtonWidth
            }
                
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: - makeUI
    private func makeUI() {
        
        contentView.backgroundColor = BaseColors.backgroundColor
        
        contentView.addSubview(deleteButton)
        contentView.addSubview(mainView)
        mainView.addSubview(folderView)
        folderView.addSubview(folderLabel)
        mainView.addSubview(dictionaryName)
        mainView.addSubview(dateLabel)
        mainView.addSubview(dictionaryImageView)
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        folderView.translatesAutoresizingMaskIntoConstraints = false
        folderLabel.translatesAutoresizingMaskIntoConstraints = false
        dictionaryName.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dictionaryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        mainViewTopAnchor = mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        mainViewHeightAnchor = mainView.heightAnchor.constraint(equalToConstant: 85)
        mainViewLeadingAnchor = mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        mainViewTrailingAnchor = mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        
        deleteButtonWidth = deleteButton.widthAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([
            
            mainViewTopAnchor!,
            mainViewLeadingAnchor!,
            mainViewHeightAnchor!,
            mainViewTrailingAnchor!,
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: mainView.topAnchor),
            deleteButtonWidth!,
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            folderView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            folderView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: padding),
            folderView.heightAnchor.constraint(equalToConstant: 25),
            folderView.widthAnchor.constraint(equalToConstant: 97),

            folderLabel.centerXAnchor.constraint(equalTo: folderView.centerXAnchor),
            folderLabel.centerYAnchor.constraint(equalTo: folderView.centerYAnchor),

            dictionaryName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: padding),
            dictionaryName.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),

            dateLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -padding),

            dictionaryImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -padding),
            dictionaryImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -19)
        ])
    }
}
