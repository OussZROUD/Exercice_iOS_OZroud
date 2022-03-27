//
//  ListItemsAdapterManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class ProductListAdapterManager: ProductListAdapterProtocol {
    
    var formatter = DateFormatter()
    var currencyFormatter = NumberFormatter()
    
    func adapteItems(products: [Product], categories: [CategoryItem]) -> [ItemCollectionViewCell.ViewModel] {
        
        return products.map { (product) -> ItemCollectionViewCell.ViewModel in
            let  category = categories.first { (category) -> Bool in
                category.identifier == product.categoryID
            }
            
            let viewModel = ItemCollectionViewCell.ViewModel(identifier: product.identifier,
                                                             category: category ?? CategoryItem(identifier: Constants.CategoryAll.identifier, name: Constants.CategoryAll.name),
                                                             title: product.title ?? "",
                                                             price: product.price?.formatToPriceCurrency(currencyFormatter: currencyFormatter) ?? "",
                                                             imageUrl: product.imageUrl?.small ?? "",
                                                             creationDate: product.creationDate?.convertToString(style:.medium) ?? Date().convertToString(style: .medium),
                                                             isUrgent: product.isUrgent ?? false)
            return viewModel
        }
    }
}
