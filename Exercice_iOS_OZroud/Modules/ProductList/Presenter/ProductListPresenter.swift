//
//  ListItemPresenter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ProductListPresenter: ProductListPresenterInputProtocol, ProductListInteractorOutputProtocol {
    
    // MARK: - PROPERTIES
    var adapterProtocol: ProductListAdapterProtocol?
    var filterProtocol: FilterProductListProtocol?
    weak var view: ProductListViewController?
    private let interactor: ProductListInteractorInputProtocol
    private let router: ProductListNavigationProtocol
    private var categories: [CategoryItem] = []
    private var products: [ItemCollectionViewCell.ViewModel] = []
    private var sortedAllItems: [Product] = []
    private var adapteeItems: [ItemCollectionViewCell.ViewModel] = []
    
    
    // MARK: - INITIALIZER
    init(interactor: ProductListInteractorInputProtocol, router:ProductListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    
    // MARK: - VIEW -> PRESENTER ListItemViewToPresenterProtocol
    func getCategories() {
        interactor.fetchCategories()
    }
    
    func getProducts() {
        interactor.fetchProducts()
    }
    
    func getCategoriesNumber() -> Int {
        return categories.count
    }
    
    func getProductsNumber() -> Int {
        return products.count
    }
    
    func populateProductCollection() -> [ItemCollectionViewCell.ViewModel] {
        return self.products
    }
    
    func populateCategoryCollection() -> [CategoryItem] {
        return self.categories
    }
    
    func getProductsWithCategoryAt(index: Int) {
        if categories[index].identifier == 0 {
            products = adapteeItems
        } else {
            guard let filterProtocol = filterProtocol else { return }
            products = filterProtocol.filterItems(itemsTofilter: adapteeItems, categoryID: categories[index].identifier)
        }
        view?.showProducts()
    }
    
    func goToProductWith(index: Int) {
        let item = sortedAllItems.filter { $0.identifier == products[index].identifier}.first
        guard let item = item, let view = view else { return }
//        router.pushToItemDetails(on: view, with: item, category: items[index].category)
        router.goToProductDetails(on: view, with: item, category: products[index].category)
    }
    
    
    // MARK: - ListItemInteractorToPresenterProtocol
    // categories response
    func getCategoriesResponse(response: Result<[CategoryItem], APIError>) {
        switch response {
            
        case .success(let categoryList):
            
            debugPrint("list category success")
            self.categories = [ CategoryItem(identifier: Constants.CategoryAll.identifier, name: Constants.CategoryAll.name)] + categoryList
            view?.showCategories()
            return
            
        case .failure(let error):
            
            debugPrint(error.message)
            view?.showFailureWith(error: error.message)
            return
        }
    }
    
    // items response
    func getProductsResponse(response: Result<[Product], APIError>) {
        switch response {
            
        case .success(let itemList):
            
            debugPrint("list item success")
            sortedAllItems = itemList.sorted()
            guard let adapterProtocol = adapterProtocol else { return }
            adapteeItems = adapterProtocol.adapteItems(products: sortedAllItems, categories: categories)
            self.products = adapteeItems
            view?.showProducts()
            
        case .failure(let error):
            
            debugPrint(error.message)
            view?.showFailureWith(error: error.message)
        }
    }
    
}
