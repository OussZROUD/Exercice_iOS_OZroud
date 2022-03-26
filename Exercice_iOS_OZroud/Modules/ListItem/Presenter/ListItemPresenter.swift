//
//  ListItemPresenter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ListItemPresenter: ListItemViewToPresenterProtocol, ListItemInteractorToPresenterProtocol {
    
    // MARK: - PROPERTIES
    var adapterProtocol: ListItemsAdapterProtocol?
    var filterProtocol: FilterListItemsProtocol?
    weak var view: ListItemViewController?
    private let interactor: ListItemPresenterToInteractorProtocol
    private let router: ListItemRouter
    private var categories: [CategoryItem] = []
    private var items: [ItemCollectionViewCell.ViewModel] = []
    private var sortedAllItems: [Item] = []
    private var adapteeItems: [ItemCollectionViewCell.ViewModel] = []
    
    
    // MARK: - INITIALIZER
    init(interactor: ListItemPresenterToInteractorProtocol, router:ListItemRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    
    // MARK: - VIEW -> PRESENTER ListItemViewToPresenterProtocol
    func fetchListCategory() {
        interactor.getListCategory()
    }
    
    func fetchListItem() {
        interactor.getListItem()
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
            guard let filterProtocol = filterProtocol else { return }
            items = filterProtocol.filterItems(itemsTofilter: adapteeItems, categoryID: categories[index].identifier)
            view?.filterListItemSuccessResponse()
        }
    }
    
    func navigateToItemDetails(index: Int) {
        let item = sortedAllItems.filter { $0.identifier == items[index].identifier}.first
        guard let item = item, let view = view else { return }
        router.pushToItemDetails(on: view, with: item, category: items[index].category)
    }
    
    
    // MARK: - ListItemInteractorToPresenterProtocol
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
            sortedAllItems = itemList.sorted()
            guard let adapterProtocol = adapterProtocol else { return }
            adapteeItems = adapterProtocol.adapteItems(items: sortedAllItems, categories: categories)
            self.items = adapteeItems
            view?.fetchListItemSuccessResponse()
            
        case .failure(let error):
            
            debugPrint(error.message)
            view?.fetchListItemFailureResponse()
        }
    }
    
}
