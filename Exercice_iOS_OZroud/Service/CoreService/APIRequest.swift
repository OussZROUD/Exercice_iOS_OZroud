//
//  APIRequest.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

// MARK: - APIREQUEST
public protocol APIRequest {
    // MARK: - PROPERTIES
    var requestType: APIRequestType { get }
    var url: String { get }
    var baseUrl: String { get }
    var session: URLSession { get }
}

// MARK: API REQUEST TYPE
public enum APIRequestType: String {
    case get = "GET"
}
