//
//  ListItemPresenterTests.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/14/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud


class ListItemPresenterTests: XCTestCase {
    
    let presenter = ListItemPresenter()
    var items: [ItemDTO] = []
    var categories : [CategoryItemDTO] = []
    
    let itemDTO1 = ItemDTO(item: Item(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let itemDTO2 = ItemDTO(item: Item(identifier: 2, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let itemDTO3 = ItemDTO(item: Item(identifier: 3, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let itemDTO4 = ItemDTO(item: Item(identifier: 4, categoryID: 8, title: nil, description: nil, price: 33.454, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let itemDTO5 = ItemDTO(item: Item(identifier: 5, categoryID: nil, title: nil, description: nil, price: 33.454, imageUrl: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    
    let categoryDTO1 = CategoryItemDTO(categoryItem: CategoryItem(identifier: 5, name: "category1"))
    let categoryDTO2 = CategoryItemDTO(categoryItem: CategoryItem(identifier: 3, name: "category2"))
    let categoryDTO3 = CategoryItemDTO(categoryItem: CategoryItem(identifier: 2, name: "category3"))
    
    override func setUpWithError() throws {
        items = [itemDTO1, itemDTO2, itemDTO3, itemDTO4, itemDTO5]
        categories = [categoryDTO1, categoryDTO2, categoryDTO3]
    }
    
    override func tearDownWithError() throws {
        items = []
        categories = []
    }
    
    // MARK: - FILTER LIST ITEM TESTS
    func test_filterListItem_optimal() throws {
        presenter.getListCategorySuccessResponse(categories: self.categories)
        presenter.getListItemSuccessResponse(items: self.items)
        presenter.filterListItem(index: 1)
        
        XCTAssertEqual(presenter.itemNumberOfItemsInSection(), 1)
        XCTAssertEqual(presenter.populateItemsCollection().first?.category.identifier, categoryDTO1.identifier)
        XCTAssertEqual(presenter.populateItemsCollection().last?.category.identifier, categoryDTO1.identifier)
    }
    
    func test_filterListItem_with_first_index() throws {
        presenter.getListCategorySuccessResponse(categories: self.categories)
        presenter.getListItemSuccessResponse(items: self.items)
        presenter.filterListItem(index: 0)
        
        XCTAssertEqual(presenter.itemNumberOfItemsInSection(), self.items.count)
        XCTAssertTrue(presenter.populateItemsCollection().contains(where: { (item) -> Bool in
            item.category.identifier == categoryDTO1.identifier
        }))
        XCTAssertTrue(presenter.populateItemsCollection().contains(where: { (item) -> Bool in
            item.category.identifier == categoryDTO2.identifier
        }))
        XCTAssertTrue(presenter.populateItemsCollection().contains(where: { (item) -> Bool in
            item.category.identifier == categoryDTO3.identifier
        }))
    }
    
    func test_filterListItem_with_no_items() throws {
        presenter.getListCategorySuccessResponse(categories: self.categories)
        presenter.getListItemSuccessResponse(items: [])
        presenter.filterListItem(index: 1)
        
        XCTAssertEqual(presenter.itemNumberOfItemsInSection(), 0)
    }
    
    func test_filterListItem_with_no_categories() throws {
        presenter.getListCategorySuccessResponse(categories: [])
        presenter.getListItemSuccessResponse(items: self.items)
        presenter.filterListItem(index: 0)
        
        XCTAssertEqual(presenter.itemNumberOfItemsInSection(), self.items.count)
        XCTAssertEqual(presenter.populateItemsCollection().first?.category.identifier, 0)
        XCTAssertEqual(presenter.populateItemsCollection().last?.category.identifier, 0)
    }
    
    // MARK: - NAVIGATION TESTS
    func test_navigation_selectedItem_correct_id(){
        presenter.getListCategorySuccessResponse(categories: categories)
        presenter.getListItemSuccessResponse(items: items)
        presenter.navigateToItemDetails(index: 2)
        XCTAssertEqual(presenter.populateItemsCollection()[2].identifier, 3)
    }
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
