//
//  ItemRemoteWorkerTest.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/19/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class ItemRemoteWorkerTest: XCTestCase {
    
    var worker: ProductRemoteWorker!

    override func setUpWithError() throws {
        worker = ProductRemoteWorker()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_success_response() throws {
        let result = worker.treatResponse(response: MokeItemAPIResponse.itemSuccessResult)
        switch result {
        case .success(let data):
            XCTAssertEqual(data.count, 3)
        case .failure(_):
            XCTFail()
        }
    }
    
    func test_failure_response_errorResultDataFailed() throws {
        let result = worker.treatResponse(response: MokeItemAPIResponse.itemErrorResultDataFailed)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(APIError.dataFailed.message,error.message)
        }
    }
    
    func test_failure_response_errorResultInvalidURL() throws {
        let result = worker.treatResponse(response: MokeItemAPIResponse.itemErrorResultInvalidURL)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(APIError.invalidURL(url: "testURL").message,error.message)
        }
    }
    
    func test_failure_response_errorResultParsingError() throws {
        let result = worker.treatResponse(response: MokeItemAPIResponse.itemErrorResultParsingError)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(APIError.parsingError.message,error.message)
        }
    }
    
    func test_failure_wrong_error() throws {
        let result = worker.treatResponse(response: MokeItemAPIResponse.itemErrorResultParsingError)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertNotEqual(APIError.dataFailed.message, error.message)
            XCTAssertNotEqual(APIError.invalidURL(url: "").message, error.message)
            XCTAssertEqual(APIError.parsingError.message, error.message)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
