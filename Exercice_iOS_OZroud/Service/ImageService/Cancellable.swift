//
//  Cancellable.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 31/3/2022.
//  Copyright © 2022 Oussama Zroud. All rights reserved.
//

import Foundation

protocol Cancellable {

    // MARK: - METHODS
    
    func cancel()

}

extension URLSessionTask: Cancellable { }
