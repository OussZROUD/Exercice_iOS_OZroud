//
//  CategoryRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class CategoryRemoteWorker {
    
    func getCategoriesFromRemote(onComplete:@escaping(Result<[CategoryItem], APIError>)-> Void) {
        ListCategoryRequest.get.executeRequest(type: [CategoryItemDTO].self) { [weak self](response) in
            let response = self?.treatResponse(response: response)
            switch response {
                
            case .success(let data):
                onComplete(.success(data))
                return
                
            case .failure(let error):
                onComplete(.failure(error))
                return
                
            case .none:
                onComplete(.failure(.dataFailed))
                return
            }
        }
    }
    
    private func treatResponse(response: Result<[CategoryItemDTO], APIError>) -> Result<[CategoryItem], APIError> {
        switch response {
            
        case .success(let data):
            let data = data.map { (categoryDTO) -> CategoryItem in
                return CategoryItem(categoryItemDTO: categoryDTO)
            }
            return .success(data)
            
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
