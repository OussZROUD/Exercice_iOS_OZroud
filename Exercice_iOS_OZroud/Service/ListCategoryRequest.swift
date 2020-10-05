//
//  ListCategoryRequest.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

enum ListCategoryRequest: APIRequest {
    
    case get
    
    var requestType: APIRequestType {
        return .get
    }
    
    var url: String {
        return Constants.Network.categoryEndPoint
    }
}
