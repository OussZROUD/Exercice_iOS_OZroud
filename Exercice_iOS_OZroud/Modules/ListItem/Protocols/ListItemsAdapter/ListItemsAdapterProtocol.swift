//
//  ListItemsAdapterProtocol.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

protocol ListItemsAdapterProtocol {
    func adapteItems(items: [ItemDTO], categories: [CategoryItemDTO]) -> [ItemCollectionViewCell.ViewModel]
}
