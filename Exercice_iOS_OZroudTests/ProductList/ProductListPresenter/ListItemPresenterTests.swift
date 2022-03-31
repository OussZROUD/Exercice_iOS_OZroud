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
    var products: [Product] = []
    var categories : [CategoryItem] = []
    
    let product1 = Product(productDTO: ProductDTO(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let product2 =  Product(productDTO: ProductDTO(identifier: 2, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let product3 =  Product(productDTO: ProductDTO(identifier: 3, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let product4 =  Product(productDTO: ProductDTO(identifier: 4, categoryID: 8, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    let product5 =  Product(productDTO: ProductDTO(identifier: 5, categoryID: nil, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil))
    
    let category1 = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 5, name: "category1"))
    let category2 = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 3, name: "category2"))
    let category3 = CategoryItem(categoryItemDTO: CategoryItemDTO(identifier: 2, name: "category3"))
    
    override func setUpWithError() throws {
        products = [product1, product2, product3, product4, product5]
        categories = [category1, category2, category3]
    }
    
    override func tearDownWithError() throws {
        products = []
        categories = []
    }
    
    // MARK: - FILTER LIST ITEM TESTS
    func test_filterListItem_optimal() throws {
        
        presenter.getCategoriesSuccessResponse(listCategory: categories)
        presenter.getProductsSuccessResponse(listProduct: products)
        presenter.getProductsWithCategoryAt(index: 1)
        
        XCTAssertEqual(presenter.getProductsNumber(), 1)
        XCTAssertEqual(presenter.populateProductCollection().first?.category.identifier, category1.identifier)
        XCTAssertEqual(presenter.populateProductCollection().last?.category.identifier, category1.identifier)
    }
    
    func test_filterListItem_with_first_index() throws {
        presenter.getCategoriesSuccessResponse(listCategory: self.categories)
        presenter.getProductsSuccessResponse(listProduct: self.products)
        presenter.getProductsWithCategoryAt(index: 0)
        
        XCTAssertEqual(presenter.getProductsNumber(), self.products.count)
        XCTAssertTrue(presenter.populateProductCollection().contains(where: { (product) -> Bool in
            product.category.identifier == category1.identifier
        }))
        XCTAssertTrue(presenter.populateProductCollection().contains(where: { (product) -> Bool in
            product.category.identifier == category2.identifier
        }))
        XCTAssertTrue(presenter.populateProductCollection().contains(where: { (product) -> Bool in
            product.category.identifier == category3.identifier
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
        presenter.getProductsSuccessResponse(listProduct: self.products)
        presenter.getProductsWithCategoryAt(index: 0)
        
        XCTAssertEqual(presenter.getProductsNumber(), self.products.count)
        XCTAssertEqual(presenter.populateProductCollection().first?.category.identifier, 0)
        XCTAssertEqual(presenter.populateProductCollection().last?.category.identifier, 0)
    }
    
    // MARK: - NAVIGATION TESTS
    func test_navigation_selectedItem_correct_id() {
        presenter.getCategoriesSuccessResponse(listCategory: categories)
        presenter.getProductsSuccessResponse(listProduct: products)
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
