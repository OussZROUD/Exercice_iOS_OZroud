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
    var view: ItemDetailsPresenterToViewProtocol? { get set }
    var interactor: ItemDetailsPresenterToInteractorProtocol? { get set }
    var router: ItemDetailsPresenterToRouterProtocol? { get set }
    func getItemDetails()
}

// MARK: - PRESENTER -> VIEW
protocol ItemDetailsPresenterToViewProtocol: class {
    func getItemDetailsResponse(item: ItemDetailsViewController.ViewModel)
}

// MARK: - PRESENTER -> ROUTER
protocol ItemDetailsPresenterToRouterProtocol: class {
    static func createModule(with item: ItemDTO, category: CategoryItemDTO) -> UIViewController
}

// MARK: - PRESENTER -> INTERACTOR
protocol ItemDetailsPresenterToInteractorProtocol: class {
    var presenter: ItemDetailsInteractorToPresenterProtocol? { get set }
}

// MARK: - INTERACTOR -> PRESENTER PROTOCOL
protocol ItemDetailsInteractorToPresenterProtocol: class {
}
