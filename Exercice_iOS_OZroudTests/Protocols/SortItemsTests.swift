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
    
    var items: [ItemDTO] = []
    
    let itemDTO1 = ItemDTO(item: Item(identifier: 1, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:54:54+0000", isUrgent: true, siret: ""))
    let itemDTO2 = ItemDTO(item: Item(identifier: 2, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T16:54:54+0000", isUrgent: false, siret: ""))
    let itemDTO3 = ItemDTO(item: Item(identifier: 3, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:57:54+0000", isUrgent: false, siret: ""))
    let itemDTO4 = ItemDTO(item: Item(identifier: 4, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:56:56+0000", isUrgent: false, siret: ""))
    let itemDTO5 = ItemDTO(item: Item(identifier: 5, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:55:55+0000", isUrgent: false, siret: ""))
    let itemDTO6 = ItemDTO(item: Item(identifier: 6, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:54:56+0000", isUrgent: false, siret: ""))
    let itemDTO7 = ItemDTO(item: Item(identifier: 7, categoryID: 0, title: "", description: "", price: 0.0, imageUrl: ImageURL(small: "", thumb: ""), creationDate: "2019-11-05T15:54:54+0000", isUrgent: false, siret: ""))
    
    override func setUpWithError() throws {
        
        items = [itemDTO7,itemDTO5,itemDTO3,itemDTO1,itemDTO6,itemDTO4,itemDTO2]
    }
    
    override func tearDownWithError() throws {
        items = []
    }
    
    func test_basic_sort(){
        let sortedItems = SortItemsManager().sort(items: items)
        XCTAssertEqual(sortedItems, [itemDTO1, itemDTO2, itemDTO3, itemDTO4, itemDTO5, itemDTO6, itemDTO7])
    }
    
    func test_sort_with_empty_table() {
        let sortedItems = SortItemsManager().sort(items: [])
        XCTAssertEqual(sortedItems, [])
    }
    
    func test_sort_with_nil_dates_non_urgent() {
        let itemDTO8 =  ItemDTO(item: Item(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: false, siret: nil))
        let itemDTO9 =  ItemDTO(item: Item(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: false, siret: nil))
        
        let sortedItems = SortItemsManager().sort(items: [itemDTO8, itemDTO9] + items)
        XCTAssertEqual(sortedItems, [itemDTO1, itemDTO2, itemDTO3, itemDTO4, itemDTO5, itemDTO6, itemDTO7, itemDTO8, itemDTO9])
    }
    
    func test_sort_with_nil_date_and_urgent() {
        let itemDTO8 = ItemDTO(item: Item(identifier: 8, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: false, siret: nil))
        let itemDTO9 = ItemDTO(item: Item(identifier: 9, categoryID: nil, title: nil, description: nil, price: nil, imageUrl: nil, creationDate: nil, isUrgent: true, siret: nil))
        
        let sortedItems = SortItemsManager().sort(items: [itemDTO8, itemDTO9] + items)
        XCTAssertEqual(sortedItems, [itemDTO1, itemDTO9, itemDTO2, itemDTO3, itemDTO4, itemDTO5, itemDTO6, itemDTO7, itemDTO8])
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
