//
//  ItemDetailsPresenter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ItemDetailsPresenter {
    
    // MARK: - PROPERTIES
    weak var view: ItemDetailsViewController?
    let interactor: ItemDetailsPresenterToInteractorProtocol
    let router: ItemDetailsRouter
    
    var adapterProtocol: ItemDetailsAdapterProtocol?
    var item: Item
    var category: CategoryItem
    
    // MARK: - INITIALIZER
    init(item: Item, category: CategoryItem,interactor:ItemDetailsPresenterToInteractorProtocol , router:ItemDetailsRouter) {
        self.item = item
        self.category = category
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - VIEW -> PRESENTER
extension ItemDetailsPresenter: ItemDetailsViewToPresenterProtocol {
    
    func getItemDetails() {
        let adaptedItemDetail = adapterProtocol?.adapteItemDetails(item: item, category: category)
        view?.getItemDetailsResponse(item: adaptedItemDetail!)
    }
}

extension ItemDetailsPresenter: ItemDetailsInteractorToPresenterProtocol {
}
