//
//  CategoryCollectionViewCell.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    let categoryLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.categoryLabelCellSize), color: .white, alignment: .center)
    
    // MARK: - OVERRIDE METHODS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? .white : .orange
            categoryLabel.textColor = isSelected ? .orange: .white
        }
    }
    
    // MARK: - PRIVATE METHODS
    private func setupLayout(){
        self.backgroundColor =  Constants.Cell.backgroundColor
        self.layer.shadowColor = Constants.Cell.shadowColor
        self.layer.shadowOffset =  Constants.Cell.shadowOffset
        self.layer.shadowOpacity = Constants.Cell.shadowOpacity
        self.layer.masksToBounds = false
        
        self.contentView.layer.borderWidth = Constants.Cell.borderWidth
        self.contentView.layer.borderColor = UIColor.orange.cgColor
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.backgroundColor = .orange
        self.contentView.addSubview(categoryLabel)
        categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
    }
}
