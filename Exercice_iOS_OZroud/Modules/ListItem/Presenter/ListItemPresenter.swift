//
//  ListItemPresenter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ListItemPresenter {
    
    // MARK: - PROPERTIES
    internal weak var view: ListItemPresenterToViewProtocol?
    internal var router: ListItemPresenterToRouterProtocol?
    internal var interactor: ListItemPresenterToInteractorProtocol?
    private var categories: [Category] = []
    private var items: [ItemCollectionViewCell.ViewModel] = []
    private let sortProtocol: SortItemsProtocol
    private var SortedAllItems: [Item] = []
    private let adapterProtocol: ListItemsAdapterProtocol
    private var adapteeItems: [ItemCollectionViewCell.ViewModel] = []
    
    // MARK: - INITIALIZER
    init(sortProtocol: SortItemsProtocol = SortItemsManager(),adapterProtocol: ListItemsAdapterProtocol = ListItemsAdapterManager()){
        self.sortProtocol = sortProtocol
        self.adapterProtocol = adapterProtocol
    }
}

// MARK: - VIEW -> PRESENTER
extension ListItemPresenter: ListItemViewToPresenterProtocol {
    
    func fetchListCategory() {
        interactor?.getListCategory()
    }
    
    func fetchListItem() {
        interactor?.getListItem()
    }
    
    func categoryNumberOfItemsInSection() -> Int {
        return categories.count
    }
    
    func itemNumberOfItemsInSection() -> Int {
        return items.count
    }
    
    func populateItemsCollection() -> [ItemCollectionViewCell.ViewModel] {
        return self.items
    }
    
    func populateCategoryCollection() -> [Category] {
        return self.categories
    }
}

// MARK: - PRESENTER -> VIEW
extension ListItemPresenter: ListItemInteractorToPresenterProtocol {
    
    func getListCategorySuccessResponse(categories: [Category]) {
        debugPrint("list category success")
    }
    
    func getListCategoryFailureResponse(error: APIError) {
        debugPrint("list category failure")
    }
    
    func getListItemSuccessResponse(items: [Item]) {
        debugPrint("list item success")
        SortedAllItems = sortProtocol.sort(items: items)
        adapteeItems = adapterProtocol.adapteItems(items: SortedAllItems, categories: categories)
        self.items = adapteeItems
        view?.fetchListItemSuccessResponse()
    }
    
    func getListItemFailureResponse(error: APIError) {
        debugPrint("list item failure")
    }
}
