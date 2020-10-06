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
    
    var items: [Item] = []
    let item7 = Item(identifier: 7, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:54:54+0000", isUrgent: false, siret: "")
    let item3 = Item(identifier: 3, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:57:54+0000", isUrgent: false, siret: "")
    let item6 = Item(identifier: 6, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:54:56+0000", isUrgent: false, siret: "")
    let item4 = Item(identifier: 4, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:56:56+0000", isUrgent: false, siret: "")
    let item5 = Item(identifier: 5, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:55:55+0000", isUrgent: false, siret: "")
    let item1 = Item(identifier: 1, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:54:54+0000", isUrgent: true, siret: "")
    let item2 = Item(identifier: 2, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T16:54:54+0000", isUrgent: false, siret: "")
    
    
    override func setUpWithError() throws {
        items = [item7,item5,item3,item1,item6,item4,item2]
    }
    
    override func tearDownWithError() throws {
        items = []
    }
    
    func test_basic_sort(){
        let sortedItems = SortItemsManager().sort(items: items)
        XCTAssertEqual(sortedItems, [item1,item2,item3,item4,item5,item6,item7])
    }
    
    func test_sort_with_empty_table() {
        let sortedItems = SortItemsManager().sort(items: [])
        XCTAssertEqual(sortedItems, [])
    }
    
    func test_sort_with_nil_dates_non_urgent() {
        let item8 = Item(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: false, siret: nil)
        let item9 = Item(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: false, siret: nil)
        
        let sortedItems = SortItemsManager().sort(items: [item8,item9]+items)
        XCTAssertEqual(sortedItems, [item1,item2,item3,item4,item5,item6,item7,item8,item9])
    }
    
    func test_sort_with_nil_date_and_urgent() {
        let item8 = Item(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: false, siret: nil)
        let item9 = Item(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: true, siret: nil)
        
        let sortedItems = SortItemsManager().sort(items: [item8,item9]+items)
        XCTAssertEqual(sortedItems, [item1,item9,item2,item3,item4,item5,item6,item7,item8])
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
