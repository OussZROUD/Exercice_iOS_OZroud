//
//  ListItemInteractor.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ProductListInteractor {
    
    // MARK: - PROPERTIES
    weak var presenter: ProductListInteractorOutputProtocol?
    private let categoryRemoteWorker: CategoryRemoteWorker?
    private let itemRemoteWorker: ProductRemoteWorker?
    
    
    // MARK: - INITIALIZER
    init(categoryWorker:CategoryRemoteWorker = CategoryRemoteWorker(), itemWorker: ProductRemoteWorker = ProductRemoteWorker()){
        categoryRemoteWorker = categoryWorker
        itemRemoteWorker = itemWorker
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}


// MARK: - PRESENTER -> INTERACTOR METHODS
extension ProductListInteractor: ProductListInteractorInputProtocol {
    
    func fetchCategories() {
        categoryRemoteWorker?.getCategoriesFromRemote(onComplete: { [weak self] (categoryResponse) in
            self?.presenter?.getCategoriesResponse(response: categoryResponse)
        })
    }
    
    func fetchProducts() {
        itemRemoteWorker?.getItemsFromRemote(onComplete: { [weak self] (itemResponse) in
            self?.presenter?.getProductsResponse(response: itemResponse)
            
        })
    }
}
