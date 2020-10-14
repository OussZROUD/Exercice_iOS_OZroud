//
//  ListItemsAdapterManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class ListItemsAdapterManager: ListItemsAdapterProtocol {
    
    var formatter = DateFormatter()
    var currencyFormatter = NumberFormatter()
    
    func adapteItems(items: [ItemDTO], categories: [CategoryItemDTO]) -> [ItemCollectionViewCell.ViewModel] {
        
        return items.map { (item) -> ItemCollectionViewCell.ViewModel in
            let  category = categories.first { (category) -> Bool in
                category.identifier == item.categoryID
            }
            
            let viewModel = ItemCollectionViewCell.ViewModel(identifier: item.identifier,
                                                             category: category ?? CategoryItemDTO(categoryItem: CategoryItem(identifier:Constants.CategoryAll.identifier, name: Constants.CategoryAll.name)),
                                                             title: item.title ?? "",
                                                             price: item.price?.formatToPriceCurrency(currencyFormatter: currencyFormatter) ?? "",
                                                             imageUrl: item.imageUrlDto?.small ?? "",
                                                             creationDate: item.creationDate?.formatStringToDate(formatter: formatter)?.convertToString(style:.medium) ?? Date().convertToString(style: .medium),
                                                             isUrgent: item.isUrgent ?? false)
            return viewModel
        }
    }
}
