//
//  MokeItemAPIResponse.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/19/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud

struct MokeItemAPIResponse {
    
    static let itemErrorResultDataFailed: Result<[ProductDTO], APIError> = Result.failure(.dataFailed)
    static let itemErrorResultParsingError: Result<[ProductDTO], APIError> = Result.failure(.parsingError)
    static let itemErrorResultInvalidURL: Result<[ProductDTO], APIError> = Result.failure(.invalidURL(url: "testURL"))
    static let itemSuccessResult: Result<[ProductDTO], APIError> = Result.success(MokeItemAPIResponse.items)
    static let itemSuccessResultEmpty: Result<[ProductDTO], APIError> = Result.success([])
    
    static let product1 = ProductDTO(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    static let product2 = ProductDTO(identifier: 2, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    static let product3 = ProductDTO(identifier: 3, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    
    static let items = [MokeItemAPIResponse.product1, MokeItemAPIResponse.product2, MokeItemAPIResponse.product3]
}
