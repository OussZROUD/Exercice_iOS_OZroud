//
//  ProductDetailsPresenterTests.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 31/3/2022.
//  Copyright © 2022 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class ProductDetailsPresenterTests: XCTestCase {
    
    let product1 = Product(productDTO: ProductDTO(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: "00000000"))
    let product2 = Product(productDTO: ProductDTO(identifier: 1, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: ""))
    let product3 = Product(productDTO: ProductDTO(identifier: 1, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: " "))
    let product4 = Product(productDTO: ProductDTO(identifier: 1, categoryID: 8, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    
    let category = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 5, name: "category"))

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_siret_value_optimal() throws {
        let adaptedProduct1 = ProductDetailsAdapterManager().adapteItemDetails(product: product1, category: category)
        XCTAssertEqual(adaptedProduct1.siret, "00000000")
    }
    
    func test_siret_value_empty() throws {
        let adaptedProduct2 = ProductDetailsAdapterManager().adapteItemDetails(product: product2, category: category)
        XCTAssertEqual(adaptedProduct2.siret, Constants.ItemDetail.emptyValue.siret, "shows non indiquer for empty siret")
    }
    
    func test_siret_value_nil() throws {
        let adaptedProduct4 = ProductDetailsAdapterManager().adapteItemDetails(product: product4, category: category)
        XCTAssertEqual(adaptedProduct4.siret, Constants.ItemDetail.emptyValue.siret, "shows non indiquer for nil siret")
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
