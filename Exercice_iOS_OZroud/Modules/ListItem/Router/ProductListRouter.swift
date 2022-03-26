//
//  ListItemRouter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

protocol Router {
    var viewController: UIViewController { get }
}

class ProductListRouter: Router,ProductListNavigationProtocol {
    
    var viewController: UIViewController {
        let view = ProductListViewController()
        let interactor = ProductListInteractor()
        let adapterManager = ListItemsAdapterManager()
        let filterManager = FilterListItemManager()
        let presenter = ProductListPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: view)
        presenter.adapterProtocol = adapterManager
        presenter.filterProtocol = filterManager
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        return navigationController
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    
    // MARK: - NAVIGATION ListItemPresenterToRouterProtocol
    func goToProductDetails(on view: UIViewController, with item: Item, category: CategoryItem) {
        let detailRouter = ItemDetailsRouter(item: item, category: category)
        view.navigationController?.pushViewController(detailRouter.viewController, animated: true)
    }
    
}
