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

    static let categoryErrorResultDataFailed: Result<[CategoryItemDTO], APIError>? = Result.failure(.dataFailed)
    static let categoryErrorResultParsingError: Result<[CategoryItemDTO], APIError>? = Result.failure(.parsingError)
    static let categoryErrorResultInvalidURL: Result<[CategoryItemDTO], APIError>? = Result.failure(.invalidURL(url: "testURL"))
    static let categorySuccessResult: Result<[CategoryItemDTO], APIError>? = Result.success(MokeCategoryWorker.categories)
    static let categories = [
        CategoryItemDTO(categoryItem: CategoryItem(identifier: 5, name: "category1")),
        CategoryItemDTO(categoryItem: CategoryItem(identifier: 3, name: "category2")),
        CategoryItemDTO(categoryItem: CategoryItem(identifier: 2, name: "category3"))
    ]
}
