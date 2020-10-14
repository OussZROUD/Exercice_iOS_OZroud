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
    var presenter: ListItemInteractorToPresenterProtocol?
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
            switch categoryResponse {
            case .success(let data):
                self?.presenter?.getListCategorySuccessResponse(categories: data)
                return
            case .failure(let error):
                self?.presenter?.getListCategoryFailureResponse(error: error)
                return
            }
        })
    }
    
    func getListItem() {
        itemRemoteWorker?.getItemsFromRemote(onComplete: { [weak self] (itemResponse) in
            
            switch itemResponse {
            case .success(let data):
                self?.presenter?.getListItemSuccessResponse(items: data)
                return
            case .failure(let error):
                self?.presenter?.getListItemFailureResponse(error: error)
                return
            }
        })
    }
}
