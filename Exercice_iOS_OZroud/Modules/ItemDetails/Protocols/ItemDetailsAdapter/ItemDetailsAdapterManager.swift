//
//  ItemDetailsAdapterManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class ItemDetailsAdapterManager: ItemDetailsAdapterProtocol {
    func adapteItemDetails(item: Item, category: Category) -> ItemDetailsViewController.ViewModel {
        
        let viewModel = ItemDetailsViewController.ViewModel(title: item.title ?? "",
                                                           category: category.name ?? Constants.CategoryAll.name,
                                                           description: item.description ?? "",
                                                           imageUrl: item.imageUrl?.thumb ?? "",
                                                           price: item.price?.formatToPriceCurrency() ?? "",
                                                           date: item.creationDate?.formatStringToDate()?.convertToString(style: .full) ?? "",
                                                           siret: item.siret ?? "non indiquer",
                                                           isUrgent: item.isUrgent ?? false)
        return viewModel
    }
}