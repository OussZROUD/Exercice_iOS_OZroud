//
//  ItemDetailsViewController.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
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
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: Constants.ImageAssets.placeHolder)
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
    private let safeArea = UILayoutGuide()
    
    // MARK: - PROPERTIES
    var presenter: ProductDetailsPresenterInputProtocol?
    
    // MARK: - INITIALIZER
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.ViewControllerTitle.detailItem
//        setupSafeArea()
        setupUI()
        presenter?.getProductDetails()
    }
    
    // MARK: - PRIVATE METHODS
    private func setupSafeArea(){
        safeArea.identifier = Constants.ListItem.SafeArea.identifier
        self.view.addLayoutGuide(safeArea)
        safeArea.widthAnchor.constraint(equalTo: view.widthAnchor, constant: Constants.ListItem.SafeArea.widthConstant).isActive = true
        safeArea.heightAnchor.constraint(equalTo: view.heightAnchor, constant: Constants.ListItem.SafeArea.heightConstant).isActive = true
        safeArea.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        safeArea.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true;
        
        scrollView.addSubview(productImage)
        productImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0.0).isActive = true
        productImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0.0).isActive = true
        productImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0.0).isActive = true
        
        self.scrollView.addSubview(self.stackView)
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10.0).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: 15.0).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 10.0).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        self.stackView.addArrangedSubview(titleLabel)
        
        self.stackView.addArrangedSubview(titleSeparator)
        titleSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        titleSeparator.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(priceTextLabel)
        self.stackView.addArrangedSubview(priceLabel)

        self.stackView.addArrangedSubview(priceSeparator)
        priceSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        priceSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        self.stackView.addArrangedSubview(categoryTextLabel)
        self.stackView.addArrangedSubview(categoryLabel)

        self.stackView.addArrangedSubview(categorySeparator)
        categorySeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        categorySeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        self.stackView.addArrangedSubview(dateTextLabel)
        self.stackView.addArrangedSubview(dateLabel)

        self.stackView.addArrangedSubview(dateSeparator)
        dateSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        dateSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        self.stackView.addArrangedSubview(siritTextLabel)
        self.stackView.addArrangedSubview(siritLabel)

        self.stackView.addArrangedSubview(siretSeparator)
        siretSeparator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        siretSeparator.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        self.stackView.addArrangedSubview(descriptionTextLabel)
        self.stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        
        scrollView.addSubview(urgentView)
        urgentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10.0).isActive = true
        urgentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,  constant: 10.0).isActive = true
        urgentView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        urgentView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
}
// MARK: - PRESENTER -> VIEW PROTOCOL
extension ProductDetailsViewController: ProductDetailsPresenterOutputProtocol {
    func showProductDetails(product: ProductDetailsViewController.ViewModel) {
        titleLabel.text = product.title
        categoryLabel.text = product.category
        priceLabel.text = "\(product.price)"
        dateLabel.text = product.date
        urgentView.isHidden = !(product.isUrgent)
        guard let url = URL(string: product.imageUrl) else { return }
        UIImage.loadFrom(url: url) { image in
            self.productImage.image = image ?? UIImage(named: Constants.ImageAssets.placeHolder)
        }
        descriptionLabel.text = product.description
        siritLabel.text = product.siret
    }
}
