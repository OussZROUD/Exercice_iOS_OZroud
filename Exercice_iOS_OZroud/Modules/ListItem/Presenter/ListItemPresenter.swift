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
    private var categories: [CategoryItem] = []
    private var items: [ItemCollectionViewCell.ViewModel] = []
    private let sortProtocol: SortItemsProtocol
    private var SortedAllItems: [Item] = []
    private let adapterProtocol: ListItemsAdapterProtocol
    private var adapteeItems: [ItemCollectionViewCell.ViewModel] = []
    private let filterProtocol: FilterListItemsProtocol
    
    // MARK: - INITIALIZER
    init(sortProtocol: SortItemsProtocol = SortItemsManager(),adapterProtocol: ListItemsAdapterProtocol = ListItemsAdapterManager(),filterProtocol: FilterListItemsProtocol = FilterListItemManager()){
        self.sortProtocol = sortProtocol
        self.adapterProtocol = adapterProtocol
        self.filterProtocol = filterProtocol
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
    
    func populateCategoryCollection() -> [CategoryItem] {
        return self.categories
    }
    
    func filterListItem(index: Int) {
        if categories[index].identifier == 0 {
            items = adapteeItems
            view?.filterListItemSuccessResponse()
        } else {
            items = filterProtocol.filterItems(itemsTofilter: adapteeItems, categoryID: categories[index].identifier)
            view?.filterListItemSuccessResponse()
        }
    }
    
    func navigateToItemDetails(index: Int) {
        let item = SortedAllItems.filter { $0.identifier == items[index].identifier}.first
        router?.pushToItemDetails(on: view!, with: item!, category: items[index].category)
    }
}

// MARK: - PRESENTER -> VIEW
extension ListItemPresenter: ListItemInteractorToPresenterProtocol {
    
    func getListCategorySuccessResponse(categories: [CategoryItem]) {
        debugPrint("list category success")
        self.categories = [CategoryItem(identifier: Constants.CategoryAll.identifier, name: Constants.CategoryAll.name)]  + categories
        view?.fetchListCategorySucessResponse()
    }
    
    func getListCategoryFailureResponse(error: APIError) {
        debugPrint(error.message)
        view?.fetchListCategoryFailure(error: error.message)
    }
    
    func getListItemSuccessResponse(items: [Item]) {
        debugPrint("list item success")
        SortedAllItems = sortProtocol.sort(items: items)
        adapteeItems = adapterProtocol.adapteItems(items: SortedAllItems, categories: categories)
        self.items = adapteeItems
        view?.fetchListItemSuccessResponse()
    }
    
    func getListItemFailureResponse(error: APIError) {
        debugPrint(error.message)
        view?.fetchListItemFailureResponse()
    }
}
