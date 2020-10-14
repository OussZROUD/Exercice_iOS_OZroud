//
//  ItemDetailsAdapterManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class ItemDetailsAdapterManager: ItemDetailsAdapterProtocol {
    
    var formatter = DateFormatter()
    var currencyFormatter = NumberFormatter()
    
    func adapteItemDetails(item: ItemDTO, category: CategoryItemDTO) -> ItemDetailsViewController.ViewModel {
        
        let viewModel = ItemDetailsViewController.ViewModel(title: item.title ?? "",
                                                           category: category.name ?? Constants.CategoryAll.name,
                                                           description: item.description ?? "",
                                                           imageUrl: item.imageUrlDto?.thumb ?? "",
                                                           price: item.price?.formatToPriceCurrency(currencyFormatter: currencyFormatter) ?? "",
                                                           date: item.creationDate?.formatStringToDate(formatter: formatter)?.convertToString(style: .full) ?? "",
                                                           siret: item.siret ?? "non indiquer",
                                                           isUrgent: item.isUrgent ?? false)
        return viewModel
    }
}
