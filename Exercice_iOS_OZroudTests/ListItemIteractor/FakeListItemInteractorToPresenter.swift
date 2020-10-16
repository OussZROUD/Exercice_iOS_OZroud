//
//  FakeListItemInteractorToPresenter.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/16/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud

class FakeListItemInteractorToPresenter: ListItemInteractorToPresenterProtocol {
    
    var listCategory: [CategoryItemDTO]?
    var listItem: [ItemDTO]?
    var error: APIError?
    
    func getListCategorySuccessResponse(categories: [CategoryItemDTO]) {
        self.listCategory = categories
    }
    
    func getListCategoryFailureResponse(error: APIError) {
        self.error = error
    }
    
    func getListItemSuccessResponse(items: [ItemDTO]) {
        self.listItem = items
    }
    
    func getListItemFailureResponse(error: APIError) {
        self.error = error
    }
    
}
