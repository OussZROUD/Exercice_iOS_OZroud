//
//  SpyListItemRequestTest.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/7/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
@testable import Exercice_iOS_OZroud

enum SpyListItemRequestTest: APIRequest {
    
    case badBaseUrl
    case badEndPoint
    case parsing
    case optimal
    
    var requestType: APIRequestType {
        return .get
    }
    
    var baseUrl: String {
        switch self {
        case .badBaseUrl:
            return "someBaseURL"
        case .badEndPoint:
            return Constants.Network.baseUrl
        case .parsing:
            return Constants.Network.baseUrl
        case .optimal:
            return Constants.Network.baseUrl
        }
    }
    
    var url: String {
        switch self {
        case .badBaseUrl:
            return Constants.Network.productEndPoint
        case .badEndPoint:
            return "someEndPoint"
        case .parsing:
            return Constants.Network.productEndPoint
        case .optimal:
            return Constants.Network.productEndPoint
        }
    }
    
}
