//
//  ItemRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
import UIKit

class ProductRemoteWorker {
    
    func getItemsFromRemote(onComplete: @escaping(Result<[Product], APIError>)-> Void) {
        
        ListItemRequest.get.executeRequest(type: [ProductDTO].self) { (response) in
            let response = self.treatResponse(response: response)
            switch response {
                
            case .success(let data):
                onComplete(.success(data))
                
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
    
    func treatResponse(response: Result<[ProductDTO], APIError>) -> Result<[Product], APIError> {
        switch response {
            
        case .success(let data):
            let data = data.map {(itemDTO) -> Product in
                return Product(itemDTO: itemDTO)
            }
            return .success(data)
            
        case .failure(let error):
            return .failure(error)
        }
    }
}
