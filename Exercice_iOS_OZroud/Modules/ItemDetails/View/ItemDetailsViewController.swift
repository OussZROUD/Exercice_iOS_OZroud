//
//  ItemDetailsViewController.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    // MARK: - VIEWMODEL
    struct ViewModel {
        var title: String
        var category: String
        var description: String
        var imageUrl: String
        var price: String
        var date: String
        var siret: String
        var isUrgent: Bool
    }
    
    // MARK: - UI
    let scrollView = UIScrollView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10;
        stackView.alignment = .leading
        return stackView
    }()
    
    let titleSeparator: SeparatorView = SeparatorView()
    let priceSeparator: SeparatorView = SeparatorView()
    let categorySeparator: SeparatorView = SeparatorView()
    let dateSeparator: SeparatorView = SeparatorView()
    let siretSeparator: SeparatorView = SeparatorView()
    
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.titleSize), color: .black, alignment: .left)
    let descriptionTextLabel: StaticLabel = StaticLabel(text: Constants.ItemDetail.Label.Text.description)
    let descriptionLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.normalSize), color: .black, alignment: .justified)
    let categoryTextLabel: StaticLabel = StaticLabel(text: Constants.ItemDetail.Label.Text.category)
    let categoryLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.normalSize), color: .black, alignment: .left)
    let priceTextLabel: StaticLabel = StaticLabel(text: Constants.ItemDetail.Label.Text.price)
    let priceLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.normalSize), color: .orange, alignment: .left)
    let dateTextLabel: StaticLabel = StaticLabel(text: Constants.ItemDetail.Label.Text.date)
    let dateLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.normalSize), color: .black, alignment: .left)
    let siritTextLabel: StaticLabel = StaticLabel(text: Constants.ItemDetail.Label.Text.siret)
    let siritLabel: CommonLabel = CommonLabel(font: .boldSystemFont(ofSize: Constants.ItemDetail.Label.FontSize.normalSize), color: .black, alignment: .left)
    
    let  urgentView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - PROPERTIES
    internal weak var presenter: ItemDetailsViewToPresenterProtocol?
    
    // MARK: - INITIALIZER
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.ViewControllerTitle.detailItem
        setupUI()
        presenter?.getItemDetails()
    }
    
    // MARK: - PRIVATE METHODS
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
        
        self.scrollView.addSubview(self.stackView)
        //constrain stack view to scroll view
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        
        //constrain width of stack view to width of self.view, NOT scroll view
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        
        self.stackView.addArrangedSubview(productImage)
        productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        productImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 300).isActive = true
        self.stackView.addArrangedSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        
        self.stackView.addArrangedSubview(titleSeparator)
        titleSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        titleSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(priceTextLabel)
        self.stackView.addArrangedSubview(priceLabel)
        priceTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        
        self.stackView.addArrangedSubview(priceSeparator)
        priceSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        priceSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(categoryTextLabel)
        self.stackView.addArrangedSubview(categoryLabel)
        categoryTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        
        self.stackView.addArrangedSubview(categorySeparator)
        categorySeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        categorySeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(dateTextLabel)
        self.stackView.addArrangedSubview(dateLabel)
        dateTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        
        self.stackView.addArrangedSubview(dateSeparator)
        dateSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        dateSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(siritTextLabel)
        self.stackView.addArrangedSubview(siritLabel)
        siritTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        siritLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        
        self.stackView.addArrangedSubview(siretSeparator)
        siretSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        siretSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(descriptionTextLabel)
        self.stackView.addArrangedSubview(descriptionLabel)
        
        descriptionTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        
        scrollView.addSubview(urgentView)
        urgentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10.0).isActive = true
        urgentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,  constant: 10.0).isActive = true
        urgentView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        urgentView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
}

extension ItemDetailsViewController: ItemDetailsPresenterToViewProtocol {
    func getItemDetailsResponse(item: ItemDetailsViewController.ViewModel) {
        titleLabel.text = item.title
        categoryLabel.text = item.category
        priceLabel.text = "\(item.price)"
        dateLabel.text = item.date
        urgentView.isHidden = !(item.isUrgent)
        guard let url = URL(string: item.imageUrl) else { return }
        UIImage.loadFrom(url: url) { image in
            self.productImage.image = image ?? UIImage(named: Constants.ImageAssets.placeHolder)
        }
        descriptionLabel.text = item.description
        siritLabel.text = item.siret
    }
}
