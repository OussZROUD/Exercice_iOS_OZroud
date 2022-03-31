//
//  ItemDetailsAdapterManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class ProductDetailsAdapterManager: ProductDetailsAdapterProtocol {
    
    var formatter = DateFormatter()
    var currencyFormatter = NumberFormatter()
    
    func adapteItemDetails(product: Product, category: CategoryItem) -> ProductDetailsViewController.ViewModel {
        
        let viewModel = ProductDetailsViewController.ViewModel(title: product.title ?? "",
                                                           category: category.name ?? Constants.CategoryAll.name,
                                                           description: product.description ?? "",
                                                           imageUrl: product.imageUrl?.thumb ?? "",
                                                           price: product.price?.formatToPriceCurrency(currencyFormatter: currencyFormatter) ?? "",
                                                           date: product.creationDate?.convertToString(style: .full) ?? "",
                                                               siret: getSiretValue(siret: product.siret),
                                                           isUrgent: product.isUrgent ?? false)
        return viewModel
    }
    
    private func getSiretValue(siret: String?) -> String {
        
        guard let siret = siret, !siret.isEmpty else { return Constants.ItemDetail.emptyValue.siret }
        return siret
    }
}
