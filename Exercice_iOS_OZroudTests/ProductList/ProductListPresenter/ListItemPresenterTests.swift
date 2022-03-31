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
    
    let presenter = ProductListPresenter(interactor: ProductListInteractor(), router: ProductListRouter())
    var items: [Product] = []
    var categories : [CategoryItem] = []
    
    let item1 = Product(itemDTO: ProductDTO(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let item2 =  Product(itemDTO: ProductDTO(identifier: 2, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let item3 =  Product(itemDTO: ProductDTO(identifier: 3, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let item4 =  Product(itemDTO: ProductDTO(identifier: 4, categoryID: 8, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let item5 =  Product(itemDTO: ProductDTO(identifier: 5, categoryID: nil, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    
    let category1 = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 5, name: "category1"))
    let category2 = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 3, name: "category2"))
    let category3 = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 2, name: "category3"))
    
    override func setUpWithError() throws {
        items = [item1, item2, item3, item4, item5]
        categories = [category1, category2, category3]
    }
    
    override func tearDownWithError() throws {
        items = []
        categories = []
    }
    
    // MARK: - FILTER LIST ITEM TESTS
    func test_filterListItem_optimal() throws {
        
        presenter.getCategoriesSuccessResponse(listCategory: categories)
        presenter.getProductsSuccessResponse(listProduct: items)
        presenter.getProductsWithCategoryAt(index: 1)
        
        XCTAssertEqual(presenter.getProductsNumber(), 1)
        XCTAssertEqual(presenter.populateProductCollection().first?.category.identifier, category1.identifier)
        XCTAssertEqual(presenter.populateProductCollection().last?.category.identifier, category1.identifier)
    }
    
    func test_filterListItem_with_first_index() throws {
        presenter.getCategoriesSuccessResponse(listCategory: self.categories)
        presenter.getProductsSuccessResponse(listProduct: self.items)
        presenter.getProductsWithCategoryAt(index: 0)
        
        XCTAssertEqual(presenter.getProductsNumber(), self.items.count)
        XCTAssertTrue(presenter.populateProductCollection().contains(where: { (item) -> Bool in
            item.category.identifier == category1.identifier
        }))
        XCTAssertTrue(presenter.populateProductCollection().contains(where: { (item) -> Bool in
            item.category.identifier == category2.identifier
        }))
        XCTAssertTrue(presenter.populateProductCollection().contains(where: { (item) -> Bool in
            item.category.identifier == category3.identifier
        }))
    }
    
    func test_filterListItem_with_no_items() throws {
        presenter.getCategoriesSuccessResponse(listCategory: self.categories)
        presenter.getProductsSuccessResponse(listProduct: [])
        presenter.getProductsWithCategoryAt(index: 1)
        
        XCTAssertEqual(presenter.getProductsNumber(), 0)
    }
    
    func test_filterListItem_with_no_categories() throws {
        presenter.getCategoriesSuccessResponse(listCategory: [])
        presenter.getProductsSuccessResponse(listProduct: self.items)
        presenter.getProductsWithCategoryAt(index: 0)
        
        XCTAssertEqual(presenter.getProductsNumber(), self.items.count)
        XCTAssertEqual(presenter.populateProductCollection().first?.category.identifier, 0)
        XCTAssertEqual(presenter.populateProductCollection().last?.category.identifier, 0)
    }
    
    // MARK: - NAVIGATION TESTS
    func test_navigation_selectedItem_correct_id() {
        presenter.getCategoriesSuccessResponse(listCategory: categories)
        presenter.getProductsSuccessResponse(listProduct: items)
        presenter.goToProductWith(index: 2)
        XCTAssertEqual(presenter.populateProductCollection()[2].identifier, 3)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
