//
//  ItemDetailsPresenter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ProductDetailsPresenter {
    
    // MARK: - PROPERTIES
    weak var view: ProductDetailsViewController?
    private let router: ItemDetailsRouter
    
    var adapterProtocol: ProductDetailsAdapterProtocol?
    private var product: Product
    private var category: CategoryItem
    
    // MARK: - INITIALIZER
    init(product: Product, category: CategoryItem, router:ItemDetailsRouter) {
        self.product = product
        self.category = category
        self.router = router
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}

// MARK: - PRODUCT DETAILS PRESENTER INPUT PROTOCOL
extension ProductDetailsPresenter: ProductDetailsPresenterInputProtocol {
    
    func getProductDetails() {
        guard let adapterProtocol = adapterProtocol else { return }
        let adaptedProductDetails = adapterProtocol.adapteItemDetails(product: product, category: category)
        view?.showProductDetails(product: adaptedProductDetails)
    }
}
