//
//  ItemDetailsRouter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ItemDetailsRouter: ItemDetailsPresenterToRouterProtocol {
    
    static func createModule(with item: Item, category: CategoryItem) -> UIViewController {
        
        let viewController = ItemDetailsViewController()
        
        let presenter: ItemDetailsViewToPresenterProtocol & ItemDetailsInteractorToPresenterProtocol = ItemDetailsPresenter(item: item, category: category)
        
        viewController.presenter = presenter
        viewController.presenter?.router = ItemDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ItemDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
