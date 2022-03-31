//
//  CategoryRemoteWorkerTests.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/16/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class CategoryRemoteWorkerTests: XCTestCase {
    
    var worker: CategoryRemoteWorker!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        worker = CategoryRemoteWorker()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_success_response() throws {
        let result = worker.treatResponse(response: MokeCategoryAPIResponse.categorySuccessResult)
        switch result {
        case .success(let data):
            XCTAssertEqual(data.count, 3)
        case .failure(_):
            XCTFail()
        }
    }
    
    
    func test_failure_response_errorResultDataFailed() throws {
        let result = worker.treatResponse(response: MokeCategoryAPIResponse.categoryErrorResultDataFailed)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(APIError.dataFailed.message,error.message)
        }
    }
    
    func test_failure_response_errorResultInvalidURL() throws {
        let result = worker.treatResponse(response: MokeCategoryAPIResponse.categoryErrorResultInvalidURL)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(APIError.invalidURL(url: "testURL").message,error.message)
        }
    }
    
    func test_failure_response_errorResultParsingError() throws {
        let result = worker.treatResponse(response: MokeCategoryAPIResponse.categoryErrorResultParsingError)
        switch result {
        case .success(_):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(APIError.parsingError.message,error.message)
        }
    }
    
    func test_failure_wrong_error() throws {
        let result = worker.treatResponse(response: MokeCategoryAPIResponse.categoryErrorResultParsingError)
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
