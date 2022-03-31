//
//  ItemDetailsContract.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

// MARK: - VIEW -> PRESENTER
protocol ProductDetailsPresenterInputProtocol: AnyObject {
    func getProductDetails()
}

// MARK: - PRESENTER -> VIEW
protocol ProductDetailsPresenterOutputProtocol: AnyObject {
    func showProductDetails(product: ProductDetailsViewController.ViewModel)
}

// MARK: - PRESENTER -> ROUTER
protocol ItemDetailsPresenterToRouterProtocol: AnyObject {
    static func createModule(with item: Product, category: CategoryItem) -> UIViewController
}

