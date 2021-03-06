//
//  SortItemsManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class SortItemsManager: SortItemsProtocol {
    
    var formatter = DateFormatter()
    
    func sort(items:[ItemDTO]) -> [ItemDTO] {
        var itemList = items
        itemList.sort { item1, item2 -> Bool in
            if item1.isUrgent ?? false && !(item2.isUrgent ?? false) { return true }
            if !(item1.isUrgent ?? false) && item2.isUrgent ?? false { return false }
            
            if item1.creationDate == nil { return false }
            if item2.creationDate == nil { return true }
            
            guard let date1 = item1.creationDate?.formatStringToDate(formatter: formatter) else { return false }
            guard let date2 = item2.creationDate?.formatStringToDate(formatter: formatter) else { return true }
            
            return date1 > date2
        }
        return itemList
    }
}
