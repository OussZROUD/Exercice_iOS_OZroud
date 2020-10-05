//
//  ItemCollectionViewCell.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - VIEWMODEL
    struct ViewModel {
        var identifier: Int
        var category: Category
        var title: String
        var price: String
        var imageUrl: String
        var creationDate: String
        var isUrgent: Bool
    }
    
    // MARK: - UI
    let titleLabel = CommonLabel(font: .boldSystemFont(ofSize: 12), color: .black, alignment: .left)
    let categoryLabel = CommonLabel(font: .systemFont(ofSize: 12), color: .orange, alignment: .left)
    let priceLabel = CommonLabel(font: .systemFont(ofSize: 12), color: .black, alignment: .left)
    let dateLabel = CommonLabel(font: .systemFont(ofSize: 12), color: .black, alignment: .left)
    
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let  urgentView: UIView = {
        let label = UIView()
        label.backgroundColor = .orange
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - OVERRIDE METHODS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE METHODS
    private func setupLayout(){
        
        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        // setup image
        contentView.addSubview(productImage)
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        productImage.widthAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        // setup urgent view
        contentView.addSubview(urgentView)
        urgentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0).isActive = true
        urgentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,  constant: 5.0).isActive = true
        urgentView.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
        urgentView.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        // higher stackView |title + category|
        let higherStackview = UIStackView()
        higherStackview.axis = .vertical
        higherStackview.spacing = 0
        higherStackview.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(higherStackview)
        higherStackview.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 5.0).isActive = true
        higherStackview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        higherStackview.addArrangedSubview(titleLabel)
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor).isActive = true
        higherStackview.addArrangedSubview(categoryLabel)
        categoryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        // lower stackView |price + date|
        let lowerStackview = UIStackView()
        lowerStackview.axis = .vertical
        lowerStackview.spacing = 0
        lowerStackview.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lowerStackview)
        lowerStackview.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 5.0).isActive = true
        lowerStackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
        lowerStackview.addArrangedSubview(priceLabel)
        priceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        lowerStackview.addArrangedSubview(dateLabel)
        dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
    }
    
    // MARK: - INTERNAL METHODS
    func populateCell(vm:ViewModel) {
        titleLabel.text = vm.title
        categoryLabel.text = "\(vm.price)"
        priceLabel.text = vm.category.name
        dateLabel.text = vm.creationDate
        urgentView.isHidden = !(vm.isUrgent)
        layer.borderColor = vm.isUrgent ? (UIColor.orange.cgColor):(UIColor.clear.cgColor)
        guard let url = URL(string: vm.imageUrl) else { return }
        UIImage.loadFrom(url: url) { image in
            self.productImage.image = image
        }
    }
}
