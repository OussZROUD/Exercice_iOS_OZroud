//
//  CategoryRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class CategoryRemoteWorker {
    
    func getCategoriesFromRemote(onComplete: @escaping((categories: [CategoryItemDTO]?, error: APIError?)) -> Void) {
        
        ListCategoryRequest.get.executeRequest(type: [CategoryItem].self) { (response) in
            switch response {
            case .success(let data):
                let dataDTO = data.map { (category) -> CategoryItemDTO in
                    return CategoryItemDTO(categoryItem: category)
                }
                onComplete((dataDTO,nil))
            case .failure(let error):
                onComplete((nil,error))
            }
        }
    }
}
