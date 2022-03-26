//
//  ListItemContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER || ListPresenterInput
protocol ListItemViewToPresenterProtocol: AnyObject {
    func fetchListCategory() // getCategories
    func categoryNumberOfItemsInSection() -> Int // getCategoriesNumber
    func populateCategoryCollection() -> [CategoryItem] //populateCategoryCollection
    func fetchListItem()// getProducts
    func itemNumberOfItemsInSection() -> Int // getProductsNumber
    func populateItemsCollection() -> [ItemCollectionViewCell.ViewModel] //populatecProductCollection
    func filterListItem(index: Int)// getProductsWithCategoryIndex
    func navigateToItemDetails(index: Int)//goToProductDetail
}

// MARK: - PRESENTER -> VIEW || ListPresenter Output -> View
protocol ListItemPresenterToViewProtocol: AnyObject {
    func fetchListCategorySucessResponse()//showCategories
    func fetchListCategoryFailure(error:String)// showError
    func fetchListItemSuccessResponse()// showProducts
    func fetchListItemFailureResponse()// showError
    func filterListItemSuccessResponse() // showProducts
}

// MARK: - PRESENTER -> INTERACTOR || ListInteractor Input
protocol ListItemPresenterToInteractorProtocol: AnyObject {
    func getListCategory()//fetchCategories
    func getListItem()// fetchProducts
}

// MARK: - INTERACTOR -> PRESENTER || ListInteractor output
protocol ListItemInteractorToPresenterProtocol: AnyObject {
    func getCategoriesResponse(response: Result<[CategoryItem], APIError>)
    func getItemsResponse(response: Result<[Item], APIError>)//getProductsResponse
}

// MARK: - PRESENTER -> ROUTER
protocol ListItemPresenterToRouterProtocol: AnyObject {
    func pushToItemDetails(on view: UIViewController, with item: Item, category: CategoryItem)//
}
