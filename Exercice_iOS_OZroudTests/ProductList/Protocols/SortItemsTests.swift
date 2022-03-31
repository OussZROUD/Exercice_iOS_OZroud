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
    
    let itemDTO1 = Product(itemDTO: ProductDTO(identifier: 1, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:54:54+0000", isUrgent: true, siret: nil))
    let itemDTO2 = Product(itemDTO: ProductDTO(identifier: 2, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T16:54:54+0000", isUrgent: false, siret: nil))
    let itemDTO3 = Product(itemDTO: ProductDTO(identifier: 3, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:57:54+0000", isUrgent: false, siret: nil))
    let itemDTO4 = Product(itemDTO: ProductDTO(identifier: 4, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:56+0000", isUrgent: false, siret: nil))
    let itemDTO5 = Product(itemDTO: ProductDTO(identifier: 5, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:55:55+0000", isUrgent: false, siret: nil))
    let itemDTO6 = Product(itemDTO: ProductDTO(identifier: 6, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:54:56+0000", isUrgent: false, siret: nil))
    let itemDTO7 = Product(itemDTO: ProductDTO(identifier: 7, categoryID: 0, title: nil, description: nil, price: 0.0, imageUrlDto: nil, creationDate: "2019-11-05T15:54:54+0000", isUrgent: false, siret: nil))
    
    override func setUpWithError() throws {
        
        items = [itemDTO7,itemDTO5,itemDTO3,itemDTO1,itemDTO6,itemDTO4,itemDTO2]
    }
    
    override func tearDownWithError() throws {
        items = []
    }
    
    func test_basic_sort(){
        let sortedItems = presenter.sortProducts(products: items)
        XCTAssertEqual(sortedItems, [itemDTO1, itemDTO2, itemDTO3, itemDTO4, itemDTO5, itemDTO6, itemDTO7])
    }
    
    func test_sort_with_empty_table() {
        let sortedItems = presenter.sortProducts(products: [])
        XCTAssertEqual(sortedItems, [])
    }
//
    func test_sort_with_nil_dates_non_urgent() {
        let itemDTO8 =  Product(itemDTO: ProductDTO(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: false, siret: nil))
        let itemDTO9 =  Product(itemDTO: ProductDTO(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: false, siret: nil))

        let sortedItems = presenter.sortProducts(products: [itemDTO8, itemDTO9] + items)
        XCTAssertEqual(sortedItems, [itemDTO1, itemDTO2, itemDTO3, itemDTO4, itemDTO5, itemDTO6, itemDTO7, itemDTO8, itemDTO9])
    }

    func test_sort_with_nil_date_and_urgent() {
        let itemDTO8 = Product(itemDTO: ProductDTO(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: false, siret: nil))
        let itemDTO9 = Product(itemDTO: ProductDTO(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrlDto: nil, creationDate: nil, isUrgent: true, siret: nil))

        let sortedItems = presenter.sortProducts(products: [itemDTO8, itemDTO9] + items)
        XCTAssertEqual(sortedItems, [itemDTO1, itemDTO9, itemDTO2, itemDTO3, itemDTO4, itemDTO5, itemDTO6, itemDTO7, itemDTO8])
    }
//
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
