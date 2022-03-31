//
//  FakeCategoryWorker.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/16/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
import XCTest
@testable import Exercice_iOS_OZroud


class FakeCategoryWorker: CategoryRemoteWorker {
    
    var result: Result<[CategoryItem], APIError>?
    
    override func getCategoriesFromRemote(onComplete: @escaping (Result<[CategoryItem], APIError>) -> Void) {
        guard let result = result else {
            XCTFail("Did not supply fake result in Fake Category worker")
            return
        }
        onComplete(result)
    }
}
