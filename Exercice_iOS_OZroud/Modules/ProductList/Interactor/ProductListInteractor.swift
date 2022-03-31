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
    var categories: [CategoryItem]?
    var products: [Product]?
    
    
    // MARK: - INITIALIZER
    init(categoryWorker:CategoryRemoteWorker = CategoryRemoteWorker(), itemWorker: ProductRemoteWorker = ProductRemoteWorker()){
        categoryRemoteWorker = categoryWorker
        itemRemoteWorker = itemWorker
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}


// MARK: - PRODUCT LIST INTERACTOR INPUT PROTOCOL
extension ProductListInteractor: ProductListInteractorInputProtocol {
    
    func fetchCategories() {
        categoryRemoteWorker?.getCategoriesFromRemote(onComplete: { [weak self] (categoryResponse) in
            switch categoryResponse {
            case .success(let data):
                self?.categories = data
                self?.presenter?.getCategoriesSuccessResponse(listCategory: data)
                return
            case .failure(let error):
                self?.presenter?.getCategoriesFailureResponse(error: error)
                return
            }
        })
    }
    
    func fetchProducts() {
        itemRemoteWorker?.getItemsFromRemote(onComplete: { [weak self] (itemResponse) in
            switch itemResponse {
            case .success(let data):
                self?.products = data
                self?.presenter?.getProductsSuccessResponse(listProduct: data)
                return
            case .failure(let error):
                self?.presenter?.getProductsFailureResponse(error: error)
                return
            }
        })
    }
    
}
