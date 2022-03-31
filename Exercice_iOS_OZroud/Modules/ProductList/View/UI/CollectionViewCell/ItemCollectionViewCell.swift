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
        var category: CategoryItem
        var title: String
        var price: String
        var imageUrl: String
        var creationDate: String
        var isUrgent: Bool
    }
    
    // MARK: - UI
    private let titleLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemCollectionCell.Label.textSize), color: .black, alignment: Constants.ItemCollectionCell.Label.alignment)
    private let categoryLabel = CommonLabel(font: .systemFont(ofSize: Constants.ItemCollectionCell.Label.textSize), color: .orange, alignment: Constants.ItemCollectionCell.Label.alignment)
    private let priceLabel = CommonLabel(font: .systemFont(ofSize: Constants.ItemCollectionCell.Label.textSize), color: .black, alignment: Constants.ItemCollectionCell.Label.alignment)
    private let dateLabel = CommonLabel(font: .systemFont(ofSize: Constants.ItemCollectionCell.Label.textSize), color: .black, alignment: Constants.ItemCollectionCell.Label.alignment)
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.ImageAssets.placeHolder)
        return imageView
    }()
    
    private let  urgentView: UIView = {
        let label = UIView()
        label.backgroundColor = .orange
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - PROPERTIES
    private lazy var imageService = ImageService()
    private var imageRequest: Cancellable?
    
    // MARK: - OVERRIDE METHODS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        titleLabel.text = ""
        categoryLabel.text = ""
        priceLabel.text = ""
        dateLabel.text = ""
        urgentView.isHidden = true
        layer.borderColor = (UIColor.clear.cgColor)
        productImage.image = UIImage(named: Constants.ImageAssets.placeHolder)
        imageRequest?.cancel()
    }
    
    // MARK: - PRIVATE METHODS
    private func setupLayout(){
        
        backgroundColor = .white
        layer.borderWidth = Constants.Cell.borderWidth
        layer.shadowColor = Constants.Cell.shadowColor
        layer.shadowOffset =  Constants.Cell.shadowOffset
        layer.shadowOpacity = Constants.Cell.shadowOpacity
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
        categoryLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor).isActive = true
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
    
    // MARK: - METHODS
    func populateCell(vm:ViewModel) {
        titleLabel.text = vm.title
        categoryLabel.text = "\(vm.price)"
        priceLabel.text = vm.category.name
        dateLabel.text = vm.creationDate
        urgentView.isHidden = !(vm.isUrgent)
        layer.borderColor = vm.isUrgent ? (UIColor.orange.cgColor):(UIColor.clear.cgColor)
        guard let url = URL(string: vm.imageUrl) else { return }
        imageRequest = imageService.image(for: url, completion: { [weak self] image in
            self?.productImage.image = image
        })
        
    }
}
