//
//  ItemDetailsContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER
protocol ItemDetailsViewToPresenterProtocol: class {
    // properties
    var view: ItemDetailsPresenterToViewProtocol? { get set }
//    var interactor: ItemDetailsPresenterToInteractorProtocol? { get set }
    var router: ItemDetailsPresenterToRouterProtocol? { get set }
    // methods
    func getItemDetails()
}

// MARK: - PRESENTER -> VIEW
protocol ItemDetailsPresenterToViewProtocol: class {
    func getItemDetailsResponse(item: ItemDetailsViewController.ViewModel)
}

// MARK: - PRESENTER TO ROUTER PROTOCOL
protocol ItemDetailsPresenterToRouterProtocol: class {
    static func createModule(with item: Item, category: Category) -> UIViewController
}
