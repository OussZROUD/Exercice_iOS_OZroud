//
//  ListItemInteractor.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ListItemInteractor {
    
    // MARK: - PROPERTIES
    internal var presenter: ListItemInteractorToPresenterProtocol?
    private var categoryRemoteWorker: CategoryRemoteWorker?
    private var itemRemoteWorker: ItemRemoteWorker?
    
    // MARK: - INITIALIZER
    init(categoryWorker:CategoryRemoteWorker = CategoryRemoteWorker(), itemWorker: ItemRemoteWorker = ItemRemoteWorker()){
        categoryRemoteWorker = categoryWorker
        itemRemoteWorker = itemWorker
    }
}

// MARK: - PRESENTER -> INTERACTOR METHODS
extension ListItemInteractor: ListItemPresenterToInteractorProtocol {
    
    func getListCategory() {
        categoryRemoteWorker?.getCategoriesFromRemote(onComplete: { [weak self] (categoryResponse) in
            guard let response = categoryResponse.categories else {
                self?.presenter?.getListCategoryFailureResponse(error: categoryResponse.error ?? APIError.dataFailed)
                return
            }
            self?.presenter?.getListCategorySuccessResponse(categories: response)
        })
    }
    
    func getListItem() {
        itemRemoteWorker?.getItemsFromRemote(onComplete: { [weak self] (itemResponse) in
            guard let response = itemResponse.items else {
                self?.presenter?.getListItemFailureResponse(error: itemResponse.error ?? APIError.dataFailed)
                return
            }
            self?.presenter?.getListItemSuccessResponse(items: response)
        })
    }
}
