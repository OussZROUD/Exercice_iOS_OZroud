//
//  ImageURL.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

struct ImageURL {
    
    // MARK: PROPERTIES
    let small: String?
    let thumb: String?
    
    init(imageUrlDTO: ImageUrlDTO) {
        self.small = imageUrlDTO.small
        self.thumb = imageUrlDTO.thumb
    }
}
