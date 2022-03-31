//
//  SortItemsTests.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class SortItemsTests: XCTestCase {
    
    let presenter = ProductListPresenter(interactor: ProductListInteractor(), router: ProductListRouter())
    
    var items: [Product] = []
    
    let product1 = Product(productDTO: ProductDTO(identifier: 1, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:54:54+0000", isUrgent: true, siret: nil))
    let product2 = Product(productDTO: ProductDTO(identifier: 2, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T16:54:54+0000", isUrgent: false, siret: nil))
    let product3 = Product(productDTO: ProductDTO(identifier: 3, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:57:54+0000", isUrgent: false, siret: nil))
    let product4 = Product(productDTO: ProductDTO(identifier: 4, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:56+0000", isUrgent: false, siret: nil))
    let product5 = Product(productDTO: ProductDTO(identifier: 5, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:55:55+0000", isUrgent: false, siret: nil))
    let product6 = Product(productDTO: ProductDTO(identifier: 6, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:54:56+0000", isUrgent: false, siret: nil))
    let product7 = Product(productDTO: ProductDTO(identifier: 7, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:54:54+0000", isUrgent: false, siret: nil))
    
    override func setUpWithError() throws {
        
        items = [product7,product5,product3,product1,product6,product4,product2]
    }
    
    override func tearDownWithError() throws {
        items = []
    }
    
    func test_basic_sort(){
        let sortedItems = presenter.sortProducts(products: items)
        XCTAssertEqual(sortedItems, [product1, product2, product3, product4, product5, product6, product7])
    }
    
    func test_sort_with_empty_table() {
        let sortedItems = presenter.sortProducts(products: [])
        XCTAssertEqual(sortedItems, [])
    }
//
    func test_sort_with_nil_dates_non_urgent() {
        let product8 =  Product(productDTO: ProductDTO(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: false, siret: nil))
        let product9 =  Product(productDTO: ProductDTO(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: false, siret: nil))

        let sortedItems = presenter.sortProducts(products: [product8, product9] + items)
        XCTAssertEqual(sortedItems, [product1, product2, product3, product4, product5, product6, product7, product8, product9])
    }

    func test_sort_with_nil_date_and_urgent() {
        let product8 = Product(productDTO: ProductDTO(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: false, siret: nil))
        let product9 = Product(productDTO: ProductDTO(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: true, siret: nil))

        let sortedItems = presenter.sortProducts(products: [product8, product9] + items)
        XCTAssertEqual(sortedItems, [product1, product9, product2, product3, product4, product5, product6, product7, product8])
    }
//
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
