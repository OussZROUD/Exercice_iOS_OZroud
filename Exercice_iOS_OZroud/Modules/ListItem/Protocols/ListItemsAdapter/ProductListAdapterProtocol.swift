//
//  ListItemsAdapterProtocol.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

protocol ProductListAdapterProtocol: AnyObject {
    func adapteItems(products: [Product], categories: [CategoryItem]) -> [ItemCollectionViewCell.ViewModel]
}
