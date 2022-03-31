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
//    let interactor: ProductDetailsInteractorInputProtocol
    let router: ItemDetailsRouter
    
    var adapterProtocol: ProductDetailsAdapterProtocol?
    var product: Product
    var category: CategoryItem
    
    // MARK: - INITIALIZER
    init(product: Product, category: CategoryItem, router:ItemDetailsRouter) {
        self.product = product
        self.category = category
//        self.interactor = interactor
        self.router = router
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}

// MARK: - VIEW -> PRESENTER
extension ProductDetailsPresenter: ProductDetailsPresenterInputProtocol {
    
    func getProductDetails() {
        guard let adapterProtocol = adapterProtocol else { return }
        let adaptedProductDetails = adapterProtocol.adapteItemDetails(product: product, category: category)
        view?.showProductDetails(product: adaptedProductDetails)
    }
}
