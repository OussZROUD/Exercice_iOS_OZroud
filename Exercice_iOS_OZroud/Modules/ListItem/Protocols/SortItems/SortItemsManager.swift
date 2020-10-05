//
//  SortItemsManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class SortItemsManager: SortItemsProtocol {
    func sort(items:[Item]) -> [Item] {
        var itemList = items
        itemList.sort { item1, item2 -> Bool in
            if item1.isUrgent ?? false && !(item2.isUrgent ?? false) { return true }
            if !(item1.isUrgent ?? false) && item2.isUrgent ?? false { return false }
            
            return item1.creationDate!.formatStringToDate()! > item2.creationDate!.formatStringToDate()!
        }
        return itemList
    }
}
