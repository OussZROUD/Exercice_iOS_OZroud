//
//  ImageUrlDTO.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/14/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

struct ImageUrlDTO {
    
    // MARK: PROPERTIES
    let small: String?
    let thumb: String?
    
    init(imageURL: ImageURL) {
        self.small = imageURL.small
        self.thumb = imageURL.thumb
    }
}
