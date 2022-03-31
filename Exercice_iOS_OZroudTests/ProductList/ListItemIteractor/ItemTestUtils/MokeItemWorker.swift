//
//  MokeItemWorker.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/15/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud


struct MokeItemWorker {

    static let itemErrorResultDataFailed: Result<[Product], APIError>? = Result.failure(.dataFailed)
    static let itemErrorResultParsingError: Result<[Product], APIError>? = Result.failure(.parsingError)
    static let itemErrorResultInvalidURL: Result<[Product], APIError>? = Result.failure(.invalidURL(url: "testURL"))
    static let itemSuccessResult: Result<[Product], APIError>? = Result.success(MokeItemWorker.items)
    static let items = [
        Product(itemDTO: ProductDTO(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)),
        Product(itemDTO: ProductDTO(identifier: 2, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)),
        Product(itemDTO: ProductDTO(identifier: 3, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    ]
}
