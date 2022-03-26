//
//  ListItemRouter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit


class ListItemRouter: ListItemPresenterToRouterProtocol {
   
    // MARK: - CREATE MODULE
    class func createModule() -> UINavigationController {
        
        let viewController = ListItemViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter: ListItemViewToPresenterProtocol & ListItemInteractorToPresenterProtocol = ListItemPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = ListItemRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ListItemInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - NAVIGATION
    func pushToItemDetails(on view: ListItemPresenterToViewProtocol, with item: Item, category: CategoryItem) {
           let itemDetailsViewController = ItemDetailsRouter.createModule(with: item, category: category)
               
           let viewController = view as! ListItemViewController
           viewController.navigationController?.pushViewController(itemDetailsViewController, animated: true)
       }
}
