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
    
    var product: Product
    var category: CategoryItem
    
    init(product:Product, category: CategoryItem) {
        self.product = product
        self.category = category

    }
    
    var viewController: UIViewController {
        
        let view = ProductDetailsViewController()
        let interactor = ProductDetailsInteractor()
        let adapterManager = ProductDetailsAdapterManager()
        let presenter = ProductDetailsPresenter(product: product, category: category, interactor: interactor, router: self)

        presenter.adapterProtocol = adapterManager
        presenter.view = view
        view.presenter = presenter
//        interactor.presenter = presenter

        return view
    }

    
}
