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
    weak var view: ListItemPresenterToViewProtocol?
    var router: ListItemPresenterToRouterProtocol?
    var interactor: ListItemPresenterToInteractorProtocol?
    private var categories: [CategoryItem] = []
    private var items: [ItemCollectionViewCell.ViewModel] = []
    private var sortedAllItems: [Item] = []
    private let adapterProtocol: ListItemsAdapterProtocol
    private var adapteeItems: [ItemCollectionViewCell.ViewModel] = []
    private let filterProtocol: FilterListItemsProtocol
    
    // MARK: - INITIALIZER
    init(adapterProtocol: ListItemsAdapterProtocol = ListItemsAdapterManager(),filterProtocol: FilterListItemsProtocol = FilterListItemManager()){
        self.adapterProtocol = adapterProtocol
        self.filterProtocol = filterProtocol
    }
}

// MARK: - VIEW -> PRESENTER
extension ListItemPresenter: ListItemViewToPresenterProtocol {
    
    func fetchListCategory() {
        self.categories = []
        interactor?.getListCategory()
    }
    
    func fetchListItem() {
        self.items = []
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
        let item = sortedAllItems.filter { $0.identifier == items[index].identifier}.first
        router?.pushToItemDetails(on: view!, with: item!, category: items[index].category)
    }
}

// MARK: - PRESENTER -> VIEW
extension ListItemPresenter: ListItemInteractorToPresenterProtocol {
    
    // categories response
    func getCategoriesResponse(response: Result<[CategoryItem], APIError>) {
        switch response {
        case .success(let categoryList):
            debugPrint("list category success")
            self.categories = [ CategoryItem(identifier: Constants.CategoryAll.identifier, name: Constants.CategoryAll.name)] + categoryList
            view?.fetchListCategorySucessResponse()
            return
        case .failure(let error):
            debugPrint(error.message)
            view?.fetchListCategoryFailure(error: error.message)
            return
        }
    }
    
    // items response
    func getItemsResponse(response: Result<[Item], APIError>) {
        switch response {
        case .success(let itemList):
            debugPrint("list item success")
            adapteeItems = adapterProtocol.adapteItems(items: itemList.sorted(), categories: categories)
            self.items = adapteeItems
            view?.fetchListItemSuccessResponse()
        case .failure(let error):
            debugPrint(error.message)
            view?.fetchListItemFailureResponse()
        }
    }

}
