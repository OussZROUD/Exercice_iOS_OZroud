//
//  FilterListItemManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class FilterListItemManager: FilterListItemsProtocol {
    
    func filterItems(itemsTofilter: [ItemCollectionViewCell.ViewModel], categoryID: Int ) -> [ItemCollectionViewCell.ViewModel] {
        itemsTofilter.filter{$0.category.identifier == categoryID }
    }
}
