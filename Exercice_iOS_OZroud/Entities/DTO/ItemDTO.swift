//
//  ItemDTO.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/14/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

 // MARK: PROPERTIES

public struct ItemDTO: Equatable {
    
    // MARK: PROPERTIES
    let identifier: Int
    let categoryID: Int?
    let title: String?
    let description: String?
    let price: Double?
    let imageUrlDto: ImageUrlDTO?
    let creationDate: String?
    let isUrgent: Bool?
    let siret: String?
    
    init(item:Item){
        self.identifier = item.identifier
        self.categoryID = item.categoryID
        self.title = item.title
        self.description = item.description
        self.price = item.price
        self.imageUrlDto = ImageUrlDTO(imageURL: item.imageUrl ?? ImageURL(small: nil, thumb: nil))
        self.creationDate = item.creationDate
        self.isUrgent = item.isUrgent
        self.siret = item.siret
    }
    
    // MARK: - EQUATABLE PROTOCOL
    public static func == (lhs: ItemDTO, rhs: ItemDTO) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }
}
