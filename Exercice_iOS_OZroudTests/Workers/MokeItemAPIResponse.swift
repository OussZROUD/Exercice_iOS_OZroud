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
    
    static let itemErrorResultDataFailed: Result<[Item], APIError> = Result.failure(.dataFailed)
    static let itemErrorResultParsingError: Result<[Item], APIError> = Result.failure(.parsingError)
    static let itemErrorResultInvalidURL: Result<[Item], APIError> = Result.failure(.invalidURL(url: "testURL"))
    static let itemSuccessResult: Result<[Item], APIError> = Result.success(MokeItemAPIResponse.items)
    static let itemSuccessResultEmpty: Result<[Item], APIError> = Result.success([])
    
    static let items = [ Item(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil),Item(identifier: 2, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil),Item(identifier: 3, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)]
}
