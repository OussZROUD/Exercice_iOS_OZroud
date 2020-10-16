//
//  CategoryItemDTO.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/14/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

struct CategoryItemDTO: Equatable {
    
    // MARK: PROPERTIES
    let identifier: Int
    let name: String?
    
    init(categoryItem: CategoryItem){
        self.identifier = categoryItem.identifier
        self.name = categoryItem.name
    }
    
    // MARK: - EQUATABLE PROTOCOL
    public static func == (lhs: CategoryItemDTO, rhs: CategoryItemDTO) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }    
}
