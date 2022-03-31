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
    var adapterProtocol: ProductListAdapterProtocol
    var filterProtocol: FilterProductListProtocol
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
        self.adapterProtocol = ProductListAdapterManager()
        self.filterProtocol = FilterProductListManager()
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    
    // MARK: - PRODUCT LIST PRESENTER INPUT PROTOCOL
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
            products = filterProtocol.filterItems(itemsTofilter: adapteeItems, categoryID: categories[index].identifier)
        }
        view?.showProducts()
    }
    
    
    // MARK: - PRODUCT LIST NAVIGATION PROTOCOL
    func goToProductWith(index: Int) {
        let item = sortedAllItems.filter { $0.identifier == products[index].identifier}.first
        guard let item = item, let view = view else { return }
        router.goToProductDetails(on: view, with: item, category: products[index].category)
    }
    
    
    // MARK: - PRODUCT LIST INTERACTOR OUTPUT PROTOCOL
    func getCategoriesSuccessResponse(listCategory: [CategoryItem]) {
        debugPrint("list category success")
        self.categories = [ CategoryItem(identifier: Constants.CategoryAll.identifier, name: Constants.CategoryAll.name)] + listCategory
        view?.showCategories()
    }
    
    func getCategoriesFailureResponse(error: APIError) {
        debugPrint(error.message)
        view?.showFailureWith()
    }
    
    func getProductsSuccessResponse(listProduct: [Product]) {
        debugPrint("list item success")
        sortedAllItems = sortProducts(products: listProduct)
        adapteeItems = self.adapterProtocol.adapteItems(products: sortedAllItems, categories: categories)
        self.products = adapteeItems
        view?.showProducts()
    }
    
    func getProductsFailureResponse(error: APIError) {
        debugPrint(error.message)
        view?.showFailureWith()
    }
    
    func sortProducts(products:[Product]) -> [Product] {
        return products.sorted()
    }
    
}
