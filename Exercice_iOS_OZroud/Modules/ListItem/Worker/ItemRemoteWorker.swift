//
//  ItemRemoteWorker.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

final class ItemRemoteWorker {
    
    internal func getItemsFromRemote(onComplete: @escaping((items: [Item]?, error: APIError?)) -> Void) {
        
        ListItemRequest.get.executeRequest(type: [Item].self) { (response) in
            switch response {
            case .success(let items):
                onComplete((items, nil))
            case .failure(let error):
                onComplete((nil, error))
            }
        }
    }
}
