//
//  APIManager.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

public extension APIRequest {
    
    // MARK:- PROPERTIES
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }
    
    var baseUrl: String {
        return Constants.Network.baseUrl
    }
    
    // MARK: - SETUP REQUEST
    func asURLRequest() throws -> URLRequest {
        
        guard var urlPath = URL(string: baseUrl) else {
            throw APIError.invalidURL(url: baseUrl)
        }
        
        urlPath.appendPathComponent(url)
        // get query params
        var request = URLRequest(url: urlPath)
        request.httpMethod = requestType.rawValue
        
        return request
    }
    
    // MARK: - EXECUTE REQUEST
    func executeRequest<T: Codable>(type:T.Type,onComplete: @escaping(Result<T, APIError>)-> Void){
        
        guard let urlRequest =  try? self.asURLRequest() else {
            onComplete(.failure(APIError.invalidURL(url: baseUrl)))
            return
        }
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                onComplete(.failure(error as? APIError ?? APIError.dataFailed))
            } else if let data = data {
                do {
                    guard let response = try? JSONDecoder().decode(type, from: data) else {
                        onComplete(.failure(APIError.parsingError))
                        return
                    }
                    onComplete(.success(response))
                }
            } else {
                onComplete(.failure(APIError.dataFailed))
            }
        }
        task.resume()
    }
}
