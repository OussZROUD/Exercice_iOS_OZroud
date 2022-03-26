//
//  CategoryItemDTO.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/14/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

struct CategoryItemDTO: Codable {
    
    // MARK: PROPERTIES
    let identifier: Int
    let name: String?
    
    public enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
       
}
