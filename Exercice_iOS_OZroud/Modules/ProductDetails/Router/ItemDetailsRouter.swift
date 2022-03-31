//
//  ItemDetailsRouter.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ItemDetailsRouter: Router {
    
    var product: Product
    var category: CategoryItem
    
    init(product:Product, category: CategoryItem) {
        self.product = product
        self.category = category
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    var viewController: UIViewController {
        
        let view = ProductDetailsViewController()
//
        let adapterManager = ProductDetailsAdapterManager()
        let presenter = ProductDetailsPresenter(product: product, category: category, router: self)

        presenter.adapterProtocol = adapterManager
        presenter.view = view
        view.presenter = presenter

        return view
    }

    
}
