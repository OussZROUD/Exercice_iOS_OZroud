//
//  Category.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

struct CategoryItem: Equatable {
    
    // MARK: PROPERTIES
    let identifier: Int
    let name: String?
    
    
    init(categoryItemDTO: CategoryItemDTO){
        self.identifier = categoryItemDTO.identifier
        self.name = categoryItemDTO.name
    }
    
    init(identifier: Int, name:String) {
        self.identifier = identifier
        self.name = name
    }
    // MARK: - EQUATABLE PROTOCOL
    public static func == (lhs: CategoryItem, rhs: CategoryItem) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }    
}
