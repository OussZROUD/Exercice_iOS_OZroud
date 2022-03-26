//
//  ItemRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

class ItemRemoteWorker {
    
//    var items: [Item]?
//    var itemsDTO: [ItemDTO]?
//    var error: APIError?
    
    func getItemsFromRemote(onComplete: @escaping(Result<[Item], APIError>)-> Void) {
        
        ListItemRequest.get.executeRequest(type: [ItemDTO].self) { (response) in
            switch response {
            case .success(let itemsDTO):
                let items =  itemsDTO.map { (itemDTO) -> Item in
                    return Item(itemDTO: itemDTO)
                }
                onComplete(.success(items))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
    
//    func treatResponse(response: Result<[Item], APIError>) -> Result<[ItemDTO], APIError> {
//        switch response {
//        case .success(let items):
//            self.items = items
//            let dataDTO =  items.map { (item) -> ItemDTO in
//                return ItemDTO(item: item)
//            }
//            self.itemsDTO = dataDTO
//            return .success(dataDTO)
//            
//        case .failure(let error):
//            self.error = error
//            return .failure(error)
//        }
//    }
}
