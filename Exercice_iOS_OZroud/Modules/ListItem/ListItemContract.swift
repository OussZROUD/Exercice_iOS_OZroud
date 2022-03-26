//
//  ListItemContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER
protocol ListItemViewToPresenterProtocol: AnyObject {
    
    var view: ListItemPresenterToViewProtocol? { get set }
    var interactor: ListItemPresenterToInteractorProtocol? { get set }
    var router: ListItemPresenterToRouterProtocol? { get set }
    func fetchListCategory()
    func fetchListItem()
    func categoryNumberOfItemsInSection() -> Int
    func itemNumberOfItemsInSection() -> Int
    func populateItemsCollection() -> [ItemCollectionViewCell.ViewModel]
    func populateCategoryCollection() -> [CategoryItem]
    func filterListItem(index: Int)
    func navigateToItemDetails(index: Int)
}

// MARK: - PRESENTER -> VIEW
protocol ListItemPresenterToViewProtocol: AnyObject {
    func fetchListCategorySucessResponse()
    func fetchListCategoryFailure(error:String)
    func fetchListItemSuccessResponse()
    func fetchListItemFailureResponse()
    func filterListItemSuccessResponse()
}

// MARK: - PRESENTER -> INTERACTOR
protocol ListItemPresenterToInteractorProtocol: AnyObject {
    var presenter: ListItemInteractorToPresenterProtocol? { get set }
    func getListCategory()
    func getListItem()
}

// MARK: - INTERACTOR -> PRESENTER
protocol ListItemInteractorToPresenterProtocol: AnyObject {
    func getCategoriesResponse(response: Result<[CategoryItem], APIError>)
    func getItemsResponse(response: Result<[Item], APIError>)
}

// MARK: - PRESENTER -> ROUTER
protocol ListItemPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UINavigationController
    func pushToItemDetails(on view: ListItemPresenterToViewProtocol, with item: Item, category: CategoryItem)
}
