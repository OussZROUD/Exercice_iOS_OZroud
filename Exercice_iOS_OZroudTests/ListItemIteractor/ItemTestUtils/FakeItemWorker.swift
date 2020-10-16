//
//  FakeItemWorker.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/15/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation
import XCTest
@testable import Exercice_iOS_OZroud

class FakeItemWorker: ItemRemoteWorker {
    
    var result: Result<[ItemDTO], APIError>?
    
    override func getItemsFromRemote(onComplete: @escaping (Result<[ItemDTO], APIError>) -> Void) {
        guard let result = result else {
            XCTFail("Did not supply fake result in Fake Item worker")
            return
        }
        onComplete(result)
    }
}
