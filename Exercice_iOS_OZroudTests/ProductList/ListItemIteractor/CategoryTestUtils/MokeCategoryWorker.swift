//
//  MokeCategoryWorker.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/15/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud


struct MokeCategoryWorker {

    static let categoryErrorResultDataFailed: Result<[CategoryItem], APIError>? = Result.failure(.dataFailed)
    static let categoryErrorResultParsingError: Result<[CategoryItem], APIError>? = Result.failure(.parsingError)
    static let categoryErrorResultInvalidURL: Result<[CategoryItem], APIError>? = Result.failure(.invalidURL(url: "testURL"))
    static let categorySuccessResult: Result<[CategoryItem], APIError>? = Result.success(MokeCategoryWorker.categories)
    static let categories = [
        CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 5, name: "category1")),
        CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 3, name: "category2")),
        CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 2, name: "category3"))
    ]
}
