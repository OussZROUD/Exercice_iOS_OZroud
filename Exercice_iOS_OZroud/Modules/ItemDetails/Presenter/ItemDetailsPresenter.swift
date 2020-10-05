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
    internal weak var view: ItemDetailsPresenterToViewProtocol?
    internal weak var router: ItemDetailsPresenterToRouterProtocol?
    internal var interactor: ItemDetailsPresenterToInteractorProtocol?
    private let adapterProtocol: ItemDetailsAdapterProtocol
    private var item: Item
    private var category: Category
    
    // MARK: - INITIALIZER
    init(item: Item, category: Category, adapterProtocol: ItemDetailsAdapterProtocol = ItemDetailsAdapterManager()) {
        self.item = item
        self.category = category
        self.adapterProtocol = adapterProtocol
    }
}

// MARK: - VIEW -> PRESENTER
extension ItemDetailsPresenter: ItemDetailsViewToPresenterProtocol {
    
    func getItemDetails() {
        let adaptedItemDetail = adapterProtocol.adapteItemDetails(item: item, category: category)
        view?.getItemDetailsResponse(item: adaptedItemDetail)
    }
}

extension ItemDetailsPresenter: ItemDetailsInteractorToPresenterProtocol {
}
