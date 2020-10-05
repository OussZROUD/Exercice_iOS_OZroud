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
    let categoryLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: 10.0), color: .white, alignment: .center)
    
    // MARK: - OVERRIDE METHODS
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        self.backgroundColor = .clear
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.orange.cgColor
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.backgroundColor = .orange
        self.contentView.addSubview(categoryLabel)
        categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        categoryLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: 1.0).isActive = true
        categoryLabel.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 1.0).isActive = true
    }
}
