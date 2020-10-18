//
//  APIRequestTest.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class APIRequestTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_bad_baseUrl() throws {
        let testExpectation = expectation(description: "failure expectation")
        SpyListItemRequestTest.badBaseUrl.executeRequest(type: [Item].self) { (response) in
            switch response {
            case .success( _):
                XCTAssert(false)
            case .failure(let error):
                switch error.self {
                case .invalidURL(url: _):
                    XCTAssert(true)
                default:
                    XCTAssert(false)
                }
            }
            testExpectation.fulfill()
        }
        wait(for: [testExpectation], timeout: 5.0)
    }
    
    func test_bad_endPoint(){
        let testExpectation = expectation(description: "failure expectation")
            SpyListItemRequestTest.badEndPoint.executeRequest(type: [Item].self) { (response) in
                switch response {
                case .success( _):
                    XCTAssert(false)
                case .failure(let error):
                    switch error.self {
                    case .invalidURL(url: _):
                        XCTAssert(true)
                    default:
                        XCTAssert(false)
                    }
                }
                testExpectation.fulfill()
            }
            wait(for: [testExpectation], timeout: 5.0)
        }
    
    func test_Parsing(){
    let testExpectation = expectation(description: "failure expectation")
        SpyListItemRequestTest.parsing.executeRequest(type: Item.self) { (response) in
            switch response {
            case .success( _):
                XCTAssert(false)
            case .failure(let error):
                switch error.self {
                case .parsingError:
                    XCTAssert(true)
                default:
                    XCTAssert(false)
                }
            }
            testExpectation.fulfill()
        }
         wait(for: [testExpectation], timeout: 5.0)
    }
    
    func test_optimal_network_request() {
        let testExpectation = expectation(description: "failure expectation")
        SpyListItemRequestTest.optimal.executeRequest(type: [Item].self) { (response) in
            switch response {
            case .success( _):
                XCTAssert(true)
            case .failure( _):
                XCTAssert(false)
                }
             testExpectation.fulfill()
            }
           wait(for: [testExpectation], timeout: 5.0)
        }
            
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

