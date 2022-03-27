//
//  ItemDTO.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/14/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

 // MARK: PROPERTIES

public struct ProductDTO: Codable,Equatable {
    
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
    
    public enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case categoryID = "category_id"
        case imageUrlDto = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case title, description, price, siret
    }
    
    // MARK: - EQUATABLE PROTOCOL
    public static func == (lhs: ProductDTO, rhs: ProductDTO) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }
}
