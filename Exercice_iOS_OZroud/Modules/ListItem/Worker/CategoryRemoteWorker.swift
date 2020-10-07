//
//  CategoryRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class CategoryRemoteWorker {
    
    internal func getCategoriesFromRemote(onComplete: @escaping((categories: [CategoryItem]?, error: APIError?)) -> Void) {
        
        ListCategoryRequest.get.executeRequest(type: [CategoryItem].self) { (response) in
            switch response {
            case .success(let data):
                onComplete((data,nil))
            case .failure(let error):
                onComplete((nil,error))
            }
        }
    }
}
