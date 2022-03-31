//
//  FakeListItemInteractorToPresenter.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/16/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud

class FakeListItemInteractorToPresenter: ProductListInteractorOutputProtocol {
    
        var listCategory: [CategoryItem]?
        var listItem: [Product]?
        var error: APIError?
    
    
    func getCategoriesSuccessResponse(listCategory: [CategoryItem]) {
        self.listCategory = listCategory
    }
    
    func getCategoriesFailureResponse(error: APIError) {
        self.error = error
    }
    
    func getProductsSuccessResponse(listProduct: [Product]) {
        self.listItem = listProduct
    }
    
    func getProductsFailureResponse(error: APIError) {
        self.error = error
    }
    
}
