//
//  Item.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

public struct Item: Codable,Equatable {
    
    public static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }
    
    // MARK: PROPERTIES
    let identifier: Int
    let categoryID: Int?
    let title: String?
    let description: String?
    let price: Double?
    let imageUrl: ImageURL?
    let creationDate: String?
    let isUrgent: Bool?
    let siret: String?
    
    public enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case categoryID = "category_id"
        case imageUrl = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case title, description, price, siret
    }
}
