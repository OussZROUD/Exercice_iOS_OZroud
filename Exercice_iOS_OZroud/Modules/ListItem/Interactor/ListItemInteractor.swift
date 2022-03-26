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
//    var categories: [CategoryItem]?
//    var items: [Item]?
    
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
            self?.presenter?.getCategoriesResponse(response: categoryResponse)
        })
    }
    
    func getListItem() {
        itemRemoteWorker?.getItemsFromRemote(onComplete: { [weak self] (itemResponse) in
            self?.presenter?.getItemsResponse(response: itemResponse)

        })
    }
}
