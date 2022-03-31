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
        if let imageUrlDto = itemDTO.imageUrlDto {
            self.imageUrl = ImageURL(imageUrlDTO: imageUrlDto)
        } else {
            self.imageUrl = nil
        }
        if let date = itemDTO.creationDate {
            self.creationDate = date.formatStringToDate(formatter: formatter)
        } else {
            self.creationDate = nil
        }
//        self.creationDate = itemDTO.creationDate?.formatStringToDate(formatter: formatter)
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
            guard let date1 = lhs.creationDate else { return false }
            guard let date2 = rhs.creationDate else { return true }
            return date1 > date2
        case (true, false):
            return true
        case (false, true):
            return false
        case (false, false):
            guard let date1 = lhs.creationDate else { return false }
            guard let date2 = rhs.creationDate else { return true }
            return date1 > date2
        case (_, _):
            return false
        }
    }
    
}
