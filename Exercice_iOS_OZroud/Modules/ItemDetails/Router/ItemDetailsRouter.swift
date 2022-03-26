//
//  ItemDetailsRouter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ItemDetailsRouter: Router {
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    var item: Item
    var category: CategoryItem
    
    init(item:Item, category: CategoryItem) {
        self.item = item
        self.category = category

    }
    
    var viewController: UIViewController {
        
        let view = ItemDetailsViewController()
        let interactor = ItemDetailsInteractor()
        let adapterManager = ItemDetailsAdapterManager()
        let presenter = ItemDetailsPresenter(item: item, category: category, interactor: interactor, router: self)

        presenter.adapterProtocol = adapterManager
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }

    
}
