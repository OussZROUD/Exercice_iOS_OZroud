//
//  ListItemIteractorTests.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/15/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class ListItemIteractorTests: XCTestCase {
    
    // MARK: - PROPERTIES
    var sut: ProductListInteractor!
    let categoryWorker = FakeCategoryWorker()
    let itemWorker = FakeItemWorker()
    let presenter = FakeListItemInteractorToPresenter()
    
    override func setUpWithError() throws {
        sut = ProductListInteractor(categoryWorker: categoryWorker, itemWorker: itemWorker)
        sut.presenter = self.presenter
    }

    override func tearDownWithError() throws {
    }

    // MARK: - ===== CATEGORIES =====
    // MARK: - CATEGORIES TESTS CASES
    func test_getCategories_sucess() throws {
        
        categoryWorker.result = MokeCategoryWorker.categorySuccessResult
        sut.fetchCategories()
    
        loadCategoriesWithSuccess()
        guard let categories = sut.categories else {
            XCTFail("Nil Category List Returned")
                       return
        }
        XCTAssertEqual(categories, MokeCategoryWorker.categories)
    }
    
    func test_getCategories_error_failedData() throws {
        loadCategoriesWithErrorDataFaild()
        switch MokeCategoryWorker.categoryErrorResultDataFailed {
        case . success( _):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(presenter.error?.message,error.message)
        default:
            XCTFail("should be a diffrent failure type")
        }
    }
    
    func test_getCategories_error_parsingerror() throws {
        loadCategoriesWithErrorParsingError()
        switch MokeCategoryWorker.categoryErrorResultParsingError {
        case . success( _):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(presenter.error?.message,error.message)
        default:
            XCTFail("should be a diffrent failure type")
        }
    }
    
    func test_getCategories_error_InvalidURL() throws {
        loadCategoriesWithErrorInvalidURL()
        switch MokeCategoryWorker.categoryErrorResultInvalidURL {
        case . success( _):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(presenter.error?.message,error.message)
        default:
            XCTFail("should be a diffrent failure type")
        }
    }
    
    // MARK:- PRIVATE METHODS CATEGORIES HELPERS
    private func loadCategoriesWithSuccess() {
        categoryWorker.result = MokeCategoryWorker.categorySuccessResult
        sut.fetchCategories()
    }
    
    private func loadCategoriesWithErrorDataFaild() {
        categoryWorker.result = MokeCategoryWorker.categoryErrorResultDataFailed
        sut.fetchCategories()
    }
    
    private func loadCategoriesWithErrorInvalidURL() {
        categoryWorker.result = MokeCategoryWorker.categoryErrorResultInvalidURL
        sut.fetchCategories()
    }
    
    private func loadCategoriesWithErrorParsingError() {
        categoryWorker.result = MokeCategoryWorker.categoryErrorResultParsingError
        sut.fetchCategories()
    }
    // MARK: - ===== ITEMS =====
    
    // MARK: - ITEMS TESTS CASES
    func test_getItems_sucess() throws {
        loadItemsWithSuccess()
        guard let items = sut.products else {
            XCTFail("Nil item List Returned")
                       return
        }
        XCTAssertEqual(items, MokeItemWorker.items)
    }
    
    func test_getItems_error_failedData() throws {
        loadItemsWithErrorDataFaild()
        switch MokeItemWorker.itemErrorResultDataFailed {
        case . success( _):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(presenter.error?.message,error.message)
        default:
            XCTFail("should be a diffrent failure type")
        }
    }
    
    func test_getItems_error_parsingerror() throws {
        loadItemsWithErrorParsingError()
        switch MokeItemWorker.itemErrorResultParsingError {
        case . success( _):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(presenter.error?.message,error.message)
        default:
            XCTFail("should be a diffrent failure type")
        }
    }
    
    func test_getItems_error_InvalidURL() throws {
        loadItemsWithErrorInvalidURL()
        switch MokeItemWorker.itemErrorResultInvalidURL {
        case . success( _):
            XCTFail("should be failure insted of success")
        case .failure(let error):
            XCTAssertEqual(presenter.error?.message,error.message)
        default:
            XCTFail("should be a diffrent failure type")
        }
    }
    
    // MARK:- PRIVATE METHODS ITEMS HELPERS
    private func loadItemsWithSuccess() {
        itemWorker.result = MokeItemWorker.itemSuccessResult
        sut.fetchProducts()
    }
    
    private func loadItemsWithErrorDataFaild() {
         itemWorker.result = MokeItemWorker.itemErrorResultDataFailed
        sut.fetchProducts()
    }
    
    private func loadItemsWithErrorInvalidURL() {
         itemWorker.result = MokeItemWorker.itemErrorResultInvalidURL
        sut.fetchProducts()
    }
    
    private func loadItemsWithErrorParsingError() {
         itemWorker.result = MokeItemWorker.itemErrorResultParsingError
        sut.fetchProducts()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
}


