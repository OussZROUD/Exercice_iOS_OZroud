//
//  ItemRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
import UIKit

class ItemRemoteWorker {
    
    func getItemsFromRemote(onComplete: @escaping(Result<[Item], APIError>)-> Void) {
        
        ListItemRequest.get.executeRequest(type: [ItemDTO].self) { (response) in
            let response = self.treatResponse(response: response)
            switch response {
                
            case .success(let data):
                debugPrint(data)
                onComplete(.success(data))
                
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
    
    private func treatResponse(response: Result<[ItemDTO], APIError>) -> Result<[Item], APIError> {
        switch response {
            
        case .success(let data):
            let data = data.map {(itemDTO) -> Item in
                return Item(itemDTO: itemDTO)
            }
            return .success(data)
            
        case .failure(let error):
            return .failure(error)
        }
    }
}
