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
    weak var view: ItemDetailsPresenterToViewProtocol?
    weak var router: ItemDetailsPresenterToRouterProtocol?
    var interactor: ItemDetailsPresenterToInteractorProtocol?
    private let adapterProtocol: ItemDetailsAdapterProtocol
    private var item: ItemDTO
    private var category: CategoryItemDTO
    
    // MARK: - INITIALIZER
    init(item: ItemDTO, category: CategoryItemDTO, adapterProtocol: ItemDetailsAdapterProtocol = ItemDetailsAdapterManager()) {
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
