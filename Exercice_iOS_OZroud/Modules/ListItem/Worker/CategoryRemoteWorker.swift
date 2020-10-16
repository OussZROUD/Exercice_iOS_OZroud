//
//  CategoryRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class CategoryRemoteWorker {
    
    func getCategoriesFromRemote(onComplete:@escaping(Result<[CategoryItemDTO], APIError>)-> Void) {
        
        ListCategoryRequest.get.executeRequest(type: [CategoryItem].self) { (response) in
            switch response {
            case .success(let data):
                let dataDTO = data.map { (category) -> CategoryItemDTO in
                    return CategoryItemDTO(categoryItem: category)
                }
                onComplete(.success(dataDTO))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}
