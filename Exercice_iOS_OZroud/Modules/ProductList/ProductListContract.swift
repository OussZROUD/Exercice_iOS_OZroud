//
//  ListItemContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER || ListPresenterInput
protocol ProductListPresenterInputProtocol: AnyObject {
    func getCategories()
    func getCategoriesNumber() -> Int
    func populateCategoryCollection() -> [CategoryItem]
    func getProducts()
    func getProductsNumber() -> Int
    func populateProductCollection() -> [ItemCollectionViewCell.ViewModel]
    func getProductsWithCategoryAt(index: Int)
    func goToProductWith(index: Int)
}

// MARK: - PRESENTER -> VIEW || ListPresenter Output -> View
protocol ProductListPresenterOutputProtocol: AnyObject {
    func showCategories()
    func showProducts()
    func showFailureWith()
}

// MARK: - PRESENTER -> INTERACTOR || ListInteractor Input
protocol ProductListInteractorInputProtocol: AnyObject {
    func fetchCategories()
    func fetchProducts()
}

// MARK: - INTERACTOR -> PRESENTER || ListInteractor output
protocol ProductListInteractorOutputProtocol: AnyObject {
    func getCategoriesSuccessResponse(listCategory:[CategoryItem])
    func getCategoriesFailureResponse(error:APIError)
    func getProductsSuccessResponse(listProduct: [Product])
    func getProductsFailureResponse(error:APIError)
}

// MARK: - PRESENTER -> ROUTER
protocol ProductListNavigationProtocol: AnyObject {
    func goToProductDetails(on view: UIViewController, with product: Product, category: CategoryItem)
}
