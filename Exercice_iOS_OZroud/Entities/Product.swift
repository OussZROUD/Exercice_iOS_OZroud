//
//  Item.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

public struct Product: Comparable {
    
    var formatter = DateFormatter()
    
    // MARK: PROPERTIES
    let identifier: Int
    let categoryID: Int?
    let title: String?
    let description: String?
    let price: Double?
    let imageUrl: ImageURL?
    let creationDate: Date?
    let isUrgent: Bool?
    let siret: String?
    
    init(itemDTO:ProductDTO){
        self.identifier = itemDTO.identifier
        self.categoryID = itemDTO.categoryID
        self.title = itemDTO.title
        self.description = itemDTO.description
        self.price = itemDTO.price
        self.imageUrl = ImageURL(imageUrlDTO: itemDTO.imageUrlDto!)
        self.creationDate = itemDTO.creationDate?.formatStringToDate(formatter: formatter)
        self.isUrgent = itemDTO.isUrgent
        self.siret = itemDTO.siret
    }
    
    // MARK: - COMPARABLE PROTOCOL 
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }
    
    public static func < (lhs: Product, rhs: Product) -> Bool {
        switch (lhs.isUrgent, rhs.isUrgent) {
        case (true, true):
            return lhs.creationDate! > rhs.creationDate!
        case (true, false):
            return true
        case (false, true):
            return false
        case (false, false):
            return lhs.creationDate! > rhs.creationDate!
        case (_, _):
            return false
        }
    }
    
}
