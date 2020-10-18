//
//  MokeAPIResponse.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/18/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud

struct MokeAPIResponse {
    static let categoryErrorResultDataFailed: Result<[CategoryItem], APIError> = Result.failure(.dataFailed)
    static let categoryErrorResultParsingError: Result<[CategoryItem], APIError> = Result.failure(.parsingError)
    static let categoryErrorResultInvalidURL: Result<[CategoryItem], APIError> = Result.failure(.invalidURL(url: "testURL"))
    static let categorySuccessResult: Result<[CategoryItem], APIError> = Result.success(MokeAPIResponse.categories)
    
    static let categories = [ CategoryItem(identifier: 5, name: "category1"),
                              CategoryItem(identifier: 3, name: "category2"),
                              CategoryItem(identifier: 2, name: "category3")]
}
