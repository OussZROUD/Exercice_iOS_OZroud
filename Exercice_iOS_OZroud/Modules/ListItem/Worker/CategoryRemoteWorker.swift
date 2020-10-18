//
//  CategoryRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class CategoryRemoteWorker {
    
    var categories: [CategoryItem]?
    var categoriesDTO: [CategoryItemDTO]?
    var error: APIError?
    
    func getCategoriesFromRemote(onComplete:@escaping(Result<[CategoryItemDTO], APIError>)-> Void) {
        
        ListCategoryRequest.get.executeRequest(type: [CategoryItem].self) { [weak self](response) in
            let response = self?.treatResponse(response: response)
            switch response {
            case .success(let data):
                onComplete(.success(data))
            case .failure(let error):
                onComplete(.failure(error))
            case .none:
                onComplete(.failure(.dataFailed))
            }
        }
    }
    
    func treatResponse(response: Result<[CategoryItem], APIError>) -> Result<[CategoryItemDTO], APIError>{
        switch response {
        case .success(let data):
            categories = data
            let dataDTO = data.map { (category) -> CategoryItemDTO in
                return CategoryItemDTO(categoryItem: category)
            }
            self.categoriesDTO = dataDTO
            return .success(dataDTO)
            
        case .failure(let error):
            self.error = error
            return .failure(error)
        }
    }
}
