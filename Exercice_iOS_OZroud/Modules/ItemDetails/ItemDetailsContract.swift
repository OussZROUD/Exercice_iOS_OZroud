//
//  ItemDetailsContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER
protocol ItemDetailsViewToPresenterProtocol: AnyObject {
    func getItemDetails()
}

// MARK: - PRESENTER -> VIEW
protocol ItemDetailsPresenterToViewProtocol: AnyObject {
    func getItemDetailsResponse(item: ItemDetailsViewController.ViewModel)
}

// MARK: - PRESENTER -> ROUTER
protocol ItemDetailsPresenterToRouterProtocol: AnyObject {
    static func createModule(with item: Item, category: CategoryItem) -> UIViewController
}

// MARK: - PRESENTER -> INTERACTOR
protocol ItemDetailsPresenterToInteractorProtocol: AnyObject {
    var presenter: ItemDetailsInteractorToPresenterProtocol? { get set }
}

// MARK: - INTERACTOR -> PRESENTER PROTOCOL
protocol ItemDetailsInteractorToPresenterProtocol: AnyObject {
}
