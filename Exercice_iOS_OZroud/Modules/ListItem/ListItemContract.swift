//
//  ListItemContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER
protocol ListItemViewToPresenterProtocol: class {
    // properties
    var view: ListItemPresenterToViewProtocol? { get set }
    var interactor: ListItemPresenterToInteractorProtocol? { get set }
    var router: ListItemPresenterToRouterProtocol? { get set }
    // methods
    func fetchListCategory()
    func fetchListItem()
    func categoryNumberOfItemsInSection() -> Int
    func itemNumberOfItemsInSection() -> Int
    func populateItemsCollection() -> [ItemCollectionViewCell.ViewModel]
    func populateCategoryCollection() -> [ Category]
}

// MARK: - PRESENTER -> VIEW
protocol ListItemPresenterToViewProtocol: class {
    func fetchListCategorySucessResponse()
    func fetchListCategoryFailure(error:String)
    func fetchListItemSuccessResponse()
    func fetchListItemFailureResponse()
    func filterListItemSuccessResponse()
}

// MARK: - PRESENTER -> INTERACTOR
protocol ListItemPresenterToInteractorProtocol: class {
    // properties
    var presenter: ListItemInteractorToPresenterProtocol? { get set }
    // methods
    func getListCategory()
    func getListItem()
}

// MARK: - INTERACTOR -> PRESENTER
protocol ListItemInteractorToPresenterProtocol: class {
    // methods
    func getListCategorySuccessResponse(categories:[Category])
    func getListCategoryFailureResponse(error:APIError)
    func getListItemSuccessResponse(items: [Item])
    func getListItemFailureResponse(error:APIError)
}

// MARK: - PRESENTER -> ROUTER
protocol ListItemPresenterToRouterProtocol: class {
    static func createModule() -> UINavigationController
}
